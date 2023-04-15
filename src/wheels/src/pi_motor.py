#!/usr/bin/python
from Emakefun_MotorHAT import Emakefun_MotorHAT, Emakefun_DCMotor, Emakefun_Servo

import time
import atexit

mh = Emakefun_MotorHAT(addr=0x60)

# recommended for auto-disabling motors on shutdown!
def turnOffMotors():
	mh.getMotor(1).run(Emakefun_MotorHAT.RELEASE)
	mh.getMotor(2).run(Emakefun_MotorHAT.RELEASE)
	mh.getMotor(3).run(Emakefun_MotorHAT.RELEASE)
	mh.getMotor(4).run(Emakefun_MotorHAT.RELEASE)

atexit.register(turnOffMotors)

################################# DC motor test!
myMotorL = mh.getMotor(2)
myMotorR = mh.getMotor(1)

def motor_init():
    pass

def motor_set_vel(l_mode, l_vel ,r_mode, r_vel):

	myMotorL.setSpeed(l_vel*1.04)
	myMotorR.setSpeed(r_vel)
	
	if l_mode=='FWD':
		myMotorL.run(Emakefun_MotorHAT.BACKWARD)
	else:
		myMotorL.run(Emakefun_MotorHAT.FORWARD)
	if r_mode=='FWD':
		myMotorR.run(Emakefun_MotorHAT.FORWARD)
	else:
		myMotorR.run(Emakefun_MotorHAT.BACKWARD)

	
