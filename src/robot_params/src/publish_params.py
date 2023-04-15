#!/usr/bin/env python3
"""
Publish robot parameters for various reasons:
    They might be needed by more than one package.
    It might be nice to be able to modify them at runtime.
    It is an obvious place to find them.

See doc at http://wiki.ros.org/rospy/Overview/Parameter%20Server
"""
import rospy
import time

# Robot parameter values
ROBOT_TICKS_PER_REV = 1260  # 105rpmx12tick per revol?? 86*12=
# ROBOT_TICKS_PER_REV = 1032*0.27/0.5  # 86*12=
ROBOT_WHEEL_CIRCUMFERENCE = 0.13502  # meters, 43mmX2pi 
# ROBOT_WHEEL_CIRCUMFERENCE = 0.8478  # meters, 43mmXpi 
ROBOT_TICKS_PER_METER = int(ROBOT_TICKS_PER_REV / ROBOT_WHEEL_CIRCUMFERENCE)
ROBOT_TRACK_WIDTH = 0.075  # Wheel Separation Distance (meters)
ROBOT_MIN_PWM_VAL = 5  # Minimum PWM value motors will turn reliably
ROBOT_MAX_PWM_VAL = 255  # Maximum allowable PWM value
ROBOT_MIN_X_VEL = 0.01  # Minimum x velocity robot can manage (m/s)
ROBOT_MAX_X_VEL = 0.5  # Maximum x velocity robot can manage (m/s)
ROBOT_MIN_Z_VEL = 0.1  # Minimum theta-z velocity robot can manage (rad/s)
ROBOT_MAX_Z_VEL = 3.0  # Maximum theta-z velocity robot can manage (rad/s)
# ROBOT_MTR_KP = 0.8  # Proportional coeff
ROBOT_MTR_KP = 0.3  # Proportional coeff
ROBOT_MTR_KD = 0.05  # Derivative coeff
ROBOT_MTR_MAX_PID_TRIM = 30  # Max allowable value for PID trim term

# end points of segments of piecewise linear curve in descending order
# where curve relates tick rate (tr) to motor speed (s)
ROBOT_TRS_CURVE = ((2018, 240),
                   (1870, 140),
                   (1738, 100),
                   (1620, 80))

param_dict = {
    'ROBOT_TICKS_PER_REV': ROBOT_TICKS_PER_REV,
    'ROBOT_WHEEL_CIRCUMFERENCE': ROBOT_WHEEL_CIRCUMFERENCE,
    'ROBOT_TICKS_PER_METER': ROBOT_TICKS_PER_METER,
    'ROBOT_TRACK_WIDTH': ROBOT_TRACK_WIDTH,
    'ROBOT_MIN_PWM_VAL': ROBOT_MIN_PWM_VAL,
    'ROBOT_MAX_PWM_VAL': ROBOT_MAX_PWM_VAL,
    'ROBOT_MIN_X_VEL': ROBOT_MIN_X_VEL,
    'ROBOT_MAX_X_VEL': ROBOT_MAX_X_VEL,
    'ROBOT_MIN_Z_VEL': ROBOT_MIN_Z_VEL,
    'ROBOT_MAX_Z_VEL': ROBOT_MAX_Z_VEL,
    'ROBOT_TRS_CURVE': ROBOT_TRS_CURVE,
    'ROBOT_MTR_KP': ROBOT_MTR_KP,
    'ROBOT_MTR_KD': ROBOT_MTR_KD,
    'ROBOT_MTR_MAX_PID_TRIM': ROBOT_MTR_MAX_PID_TRIM
    }
    
for key, val in list(param_dict.items()):
    rospy.set_param(key, val)
