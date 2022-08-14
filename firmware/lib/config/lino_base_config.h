#ifndef LINO_BASE_CONFIG_H
#define LINO_BASE_CONFIG_H

//uncomment the base you're building
#define LINO_BASE DIFFERENTIAL_DRIVE // 2WD and Tracked robot w/ 2 motors
#define USE_BTS7960_DRIVER
#define USE_MPU6050_IMU

#define DEBUG 0

#define K_P 0.8 // P constant
#define K_I 0.2 // I constant
#define K_D 0.5 // D constant

//define your robot' specs here
#define MAX_RPM 100               // motor's maximum RPM

// 12 encoder resolution
// 150:1 gear ratio
#define COUNTS_PER_REV 1800       // wheel encoder's no of ticks per rev
#define WHEEL_DIAMETER 0.033       // wheel's diameter in meters
#define PWM_BITS 8                // PWM Resolution of the microcontroller
#define LR_WHEELS_DISTANCE 0.086  // distance between left and right wheels
#define FR_WHEELS_DISTANCE 0.30   // distance between front and rear wheels. Ignore this if you're on 2WD/ACKERMANN

//=================BIGGER ROBOT SPEC (BTS7960)=============================
// #define K_P 0.05  // P constant
// #define K_I 0.9   // I constant
// #define K_D 0.1   // D constant

// define your robot' specs here
// #define MAX_RPM 45               // motor's maximum RPM
// #define COUNTS_PER_REV 4000      // wheel encoder's no of ticks per rev
// #define WHEEL_DIAMETER 0.15      // wheel's diameter in meters
// #define PWM_BITS 8               // PWM Resolution of the microcontroller
// #define LR_WHEELS_DISTANCE 0.32  // distance between left and right wheels
// #define FB_WHEELS_DISTANCE 0.38  // distance between front and back wheels. Ignore this if you're on 2WD/ACKERMANN
//================= END OF BIGGER ROBOT SPEC =============================

/*
ROBOT ORIENTATION
         FRONT
    MOTOR1  MOTOR2  (2WD/ACKERMANN)
    MOTOR3  MOTOR4  (4WD/MECANUM)  
         BACK
*/

/// ENCODER PINS
// MEGA pins: 2, 3, 18, 19, 20, 21

//https://www.electrorules.com/esp32-pinout-reference/

#define MOTOR_DRIVER L298

#define MOTOR1_ENCODER_A 25
#define MOTOR1_ENCODER_B 26 

#define MOTOR2_ENCODER_A 32
#define MOTOR2_ENCODER_B 33 

#define MOTOR1_PWM 1 //DON'T TOUCH THIS! This is just a placeholder
#define MOTOR1_IN_A 18
#define MOTOR1_IN_B 19

#define MOTOR2_PWM 8 //DON'T TOUCH THIS! This is just a placeholder
#define MOTOR2_IN_A 12
#define MOTOR2_IN_B 14

#define PWM_MAX pow(2, PWM_BITS) - 1
#define PWM_MIN -PWM_MAX

#endif
