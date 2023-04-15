#!/usr/bin/env python3
""" ROS node for driving wheel motors and reading their encoders.

Subscribe to topic:
    /cmd_vel
    
Publish on topics:
    /right_ticks
    /left_ticks
    /act_vel

Decoder class from rotary_encoder.py example at:
https://abyz.me.uk/rpi/pigpio/examples.html
Hook up A and B so that values increase when moving forward.
pigpio daemon must be running. Launch with 'sudo pigpiod'.
"""

import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import Int32, Float32
import pigpio
from rotary_encoder import Decoder

import pi_motor

MTR_DEBUG = True  # enable/disable printing of mtr pwm values

# Set up gpio (Broadcom) pin aliases
#left_mtr_spd_pin = 17
# left_mtr_in1_pin = 5
# left_mtr_in2_pin = 6

#right_mtr_spd_pin = 11
# right_mtr_in1_pin = 13
# right_mtr_in2_pin = 19

#E1
# left_enc_A_pin = 5
# left_enc_B_pin = 6
# right_enc_A_pin = 13
# right_enc_B_pin = 19

left_enc_A_pin = 13
left_enc_B_pin = 19
right_enc_A_pin = 5
right_enc_B_pin = 6


TRS_CURVE = rospy.get_param('ROBOT_TRS_CURVE')
TRS_COEFF = None

TICKS_PER_REV = rospy.get_param('ROBOT_TICKS_PER_REV')
TICKS_PER_METER = rospy.get_param('ROBOT_TICKS_PER_METER')
TRACK_WIDTH = rospy.get_param('ROBOT_TRACK_WIDTH')
MIN_PWM_VAL = rospy.get_param('ROBOT_MIN_PWM_VAL')
MAX_PWM_VAL = rospy.get_param('ROBOT_MAX_PWM_VAL')
MIN_X_VEL = rospy.get_param('ROBOT_MIN_X_VEL')

new_ttr = False  # Flag signifying target tick rate values are new
L_ttr = 0  # Left wheel target tick rate
R_ttr = 0  # Right wheel target tick rate
L_spd = 0  # Left motor speed (pos 8-bit int) for PWM signal
R_spd = 0  # Right motor speed (pos 8-bit int) for PWM signal
L_mode = 'OFF'  # motor mode: 'FWD', 'REV', 'OFF'
R_mode = 'OFF'

# PID stuff
KP = rospy.get_param('ROBOT_MTR_KP')
KD = rospy.get_param('ROBOT_MTR_KD')
L_prev_err = 0
R_prev_err = 0
MAX_PID_TRIM = rospy.get_param('ROBOT_MTR_MAX_PID_TRIM')

def listener():
    """Listen to cmd_vel topic. Send Twist msg to callback. """
    rospy.Subscriber("/cmd_vel", Twist, listener_callback)

def listener_callback(msg):
    """Extract linear.x and angular.z from Twist msg."""
    cmd_vel_x = msg.linear.x  # meters/sec
    cmd_vel_z = msg.angular.z  # radians/sec
    convert_cmd_vels_to_target_tick_rates(cmd_vel_x, cmd_vel_z)

def convert_cmd_vels_to_target_tick_rates(x, theta):
    """
    Convert x and theta (target velocities) to L and R target tick rates.

    Save target tick rates in global values.
    Set global flag to signify whether target tick rate values are new.
    Set global flag to signify whether robot is turning in place.
    """

    global L_ttr, R_ttr, new_ttr

    # Superimpose linear and angular components of robot velocity
    vel_L_wheel = x - (theta * (TRACK_WIDTH / 2))
    vel_R_wheel = x + (theta * (TRACK_WIDTH / 2))

    # Convert wheel velocity to tick rate
    L_rate = vel_L_wheel * TICKS_PER_METER
    R_rate = vel_R_wheel * TICKS_PER_METER

    # Are these new values?
    if L_ttr != L_rate:
        L_ttr = L_rate
        new_ttr = True
    if R_ttr != R_rate:
        R_ttr = R_rate
        new_ttr = True
    # Are these new values?
    L_ttr = L_rate
    new_ttr = True
    R_ttr = R_rate
    new_ttr = True

def tr_to_spd(tick_rate):
    """Convert tick_rate to spd (positive integer). Return spd.

    The empirical relationship between target tick rate and the spd signal
    sent to the motors has been found to roughly follow a parabolic curve
    with shallower slope at low speed. This relationship is pretty closely
    approximated by a piecewise linear curve comprised of linked chain of
    linear segments.
    The tick_rate & mtr_spd values of the segment end points are defined in
    the tuple TRS_CURVE ((trn, spn), ... (tr, sp2), (tr1, sp1), (tr0, sp0))

    In the present algorithm, the tick rate is examined to see which segment
    applies to it, starting with the steepest (highest value). The applicable
    slope and intercept are then used to calculate the value of spd.
    """
    global TRS_COEFF
    tick_rate = abs(tick_rate)

    # This just gets done once.
    if not TRS_COEFF:
        # Build list of coefficients (lower_limit, m, b) for each segment
        # m=slope, b=intercept, applicable for tick_rate > lower_limit
        TRS_COEFF = []
        tr2 = 0
        sp2 = 0
        for tr1, sp1 in TRS_CURVE:
            if tr2:
                m = (sp2 - sp1) / (tr2 - tr1)
                b = sp1 - m * tr1
                coeffs = (tr1, m, b)
                TRS_COEFF.append(coeffs)
            tr2 = tr1
            sp2 = sp1

    # This happens every time
    spd = 0
    for lower_limit, m, b in TRS_COEFF:
        if tick_rate > lower_limit:
            spd = int(m * tick_rate + b)
            break
    return spd
    
def set_mtr_spd(pi, latr, ratr):
    """
    Derive motor speed and mode from L & R target tick rates. Drive motors.

    Target tick rates are converted to "best guess" PWM values to drive the
    motors using an empirical curve.
    
    Tick rates can be either positive or negative, wheras motor speed (spd)
    will always be a positive 8-bit int (0-255). Therefore, it is needed to
    specify a mode for the motors: FWD, REV, or OFF.

    At low speeds, a very small PWM signal struggles to get the motor to
    overcome an inherently unknowable amount of friction. This makes it very
    difficult for the robot to accurately follow the command velocity.

    To improve the robot's ability to accurately follow the command velocity,
    (especially noticeable when making slow, in-place turns) PID feedback is
    used to minimize the difference between target and actual tick rate (error).
    """

    global new_ttr, L_spd, R_spd, L_mode, R_mode, L_prev_err, R_prev_err

    # Calculate new spd values when target tick rate changes
    if new_ttr:
        L_spd = tr_to_spd(L_ttr)
        R_spd = tr_to_spd(R_ttr)
        assert L_spd >= 0
        assert R_spd >= 0

        # Determine L & R modes
        if L_ttr > 0:
            L_mode = 'FWD'
        elif L_ttr < 0:
            L_mode = 'REV'
        else:
            L_mode = 'OFF'

        if R_ttr > 0:
            R_mode = 'FWD'
        elif R_ttr < 0:
            R_mode = 'REV'
        else:
            R_mode = 'OFF'

        # Reset flag
        new_ttr = False

    

    # Find tick rate error
    L_err = abs(L_ttr) - abs(latr)
    R_err = abs(R_ttr) - abs(ratr)

    # Calculate proportional term
    L_pro = int(L_err * KP)
    R_pro = int(R_err * KP)

    # Calculate derivative term
    L_der = (L_err - L_prev_err) * KD
    R_der = (R_err - R_prev_err) * KD
    L_prev_err = L_err
    R_prev_err = R_err

    # Combine terms and integerize
    L_pid_trim = int(L_pro + L_der)
    R_pid_trim = int(R_pro + R_der)

    # Limit value of PID trim
    if L_pid_trim > MAX_PID_TRIM:
        L_pid_trim = MAX_PID_TRIM
    elif L_pid_trim < -MAX_PID_TRIM:
        L_pid_trim = -MAX_PID_TRIM
    if R_pid_trim > MAX_PID_TRIM:
        R_pid_trim = MAX_PID_TRIM
    elif R_pid_trim < -MAX_PID_TRIM:
        R_pid_trim = -MAX_PID_TRIM

    # Add PID feedback to minimize error
    L_PWM_val = L_spd + L_pid_trim
    R_PWM_val = R_spd + R_pid_trim

    if L_spd is not 0 and MTR_DEBUG:
        print(f"R_spd={R_spd}\tR_pid_trim={R_pid_trim}\tR_err={R_err}\tL_spd={L_spd}\tL_pid_trim={L_pid_trim}\tL_err={L_err}")
        # print(f"Rtarget={abs(R_ttr)}\tRcurrnet={ratr}\tR_err={R_err}\tLtarget={abs(L_ttr)}\tLcurrnet={latr}\tL_err={L_err}\tL_pid_trim={abs(L_pid_trim)}\tR_pid_trim={R_pid_trim}")
    # print(f"L_pid_trim={(L_pid_trim)}\tL_err={L_err}\tR_pid_trim={R_pid_trim}\tR_err={R_err}\tL_PWM_val={L_PWM_val}\tR_PWM_val={R_PWM_val}")
        
    # Limit PWM values to acceptable range
    if R_PWM_val > MAX_PWM_VAL:
        R_PWM_val = MAX_PWM_VAL
    elif R_PWM_val < MIN_PWM_VAL:
        R_PWM_val = 0

    if L_PWM_val > MAX_PWM_VAL:
        L_PWM_val = MAX_PWM_VAL
    elif L_PWM_val < MIN_PWM_VAL:
        L_PWM_val = 0

    # Send PWM values to the motors
    # Set motor direction pins appropriately
    pi_motor.motor_set_vel(L_mode, L_PWM_val, R_mode, R_PWM_val)
    # pi_motor.motor_set_vel(L_mode, L_PWM_val, R_mode, 0)
    
left_pos = 0
def left_enc_callback(tick):
    """Add 1 tick (either +1 or -1)"""
    
    global left_pos
    left_pos += tick

right_pos = 0
def right_enc_callback(tick):
    """Add 1 tick (either +1 or -1)"""
    
    global right_pos
    right_pos += tick


if __name__ == '__main__':

    # Listen to /cmd_vel topic
    listener()

    # Set up to publish encoder data
    pi = pigpio.pi()
    left_decoder = Decoder(pi, left_enc_A_pin, left_enc_B_pin, left_enc_callback)
    left_pub_ticks = rospy.Publisher('left_ticks', Int32, queue_size=10)
    right_decoder = Decoder(pi, right_enc_A_pin, right_enc_B_pin, right_enc_callback)
    right_pub_ticks = rospy.Publisher('right_ticks', Int32, queue_size=10)
    rospy.init_node('wheels', anonymous=True)
    rate = rospy.Rate(10)

    # Set up to publish actual velocity
    actual_vel = Twist()
    robot_vel = rospy.Publisher('act_vel', Twist, queue_size=10)

    # Publish encoder data
    prev_left_pos = 0
    prev_right_pos = 0
    prev_L_atr = 0
    prev_R_atr = 0
    prev_time = rospy.Time.now().to_sec()
    while not rospy.is_shutdown():
        # publish cumulative tick data
        left_pub_ticks.publish(left_pos)
        right_pub_ticks.publish(right_pos)

        # Calculate actual tick rate for left & right wheels
        delta_left_pos = left_pos - prev_left_pos
        delta_right_pos = right_pos - prev_right_pos
        prev_left_pos = left_pos
        prev_right_pos = right_pos
        curr_time = rospy.Time.now().to_sec()
        delta_time = curr_time - prev_time
        prev_time = rospy.Time.now().to_sec()
        L_atr = delta_left_pos / delta_time
        R_atr = delta_right_pos / delta_time

        # Calculate robot actual velocity
        x_vel = ((R_atr + L_atr) / 2) / TICKS_PER_METER  # meters/sec
        z_vel = ((R_atr - L_atr) / TRACK_WIDTH) / TICKS_PER_METER  # rad/sec
        prev_L_atr = L_atr
        prev_R_atr = R_atr

        # Publish robot actual velocity
        actual_vel.linear.x = x_vel
        actual_vel.angular.z = z_vel
        # if L_spd and MTR_DEBUG:
        #     print(f"\t\t\t\t\t\tx_vel={abs(x_vel)}\tz_vel={z_vel}")
        #     print(f"\t\t\t\t\t\tvel_sum={abs(R_atr + L_atr)}\tvel_dif={abs(R_atr - L_atr)}")

        robot_vel.publish(actual_vel)

        # Set motor speeds
        set_mtr_spd(pi, L_atr, R_atr)

        rate.sleep()

    # Clean up & exit
    print("\nExiting")
    left_decoder.cancel()
    right_decoder.cancel()
    pi_motor.turnOffMotors()
    
    # pi.set_servo_pulsewidth(left_mtr_spd_pin, 0)
    # pi.set_servo_pulsewidth(right_mtr_spd_pin, 0)
    # pi.stop()
