execute_process(COMMAND "/home/pi/workspace/BotPico/build/pi_vision/ros2opencv/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/pi/workspace/BotPico/build/pi_vision/ros2opencv/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
