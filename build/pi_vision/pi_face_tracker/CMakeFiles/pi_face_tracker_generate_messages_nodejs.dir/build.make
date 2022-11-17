# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/workspace/BotPico/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/workspace/BotPico/build

# Utility rule file for pi_face_tracker_generate_messages_nodejs.

# Include the progress variables for this target.
include pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/progress.make

pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/FaceEvent.js
pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Face.js
pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Faces.js
pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/KeyCommand.js
pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/SetROI.js


/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/FaceEvent.js: /opt/ros/noetic/lib/gennodejs/gen_nodejs.py
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/FaceEvent.js: /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/FaceEvent.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/workspace/BotPico/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating Javascript code from pi_face_tracker/FaceEvent.msg"
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gennodejs/cmake/../../../lib/gennodejs/gen_nodejs.py /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/FaceEvent.msg -Ipi_face_tracker:/home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg -Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg -p pi_face_tracker -o /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg

/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Face.js: /opt/ros/noetic/lib/gennodejs/gen_nodejs.py
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Face.js: /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/Face.msg
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Face.js: /opt/ros/noetic/share/geometry_msgs/msg/Point.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/workspace/BotPico/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Javascript code from pi_face_tracker/Face.msg"
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gennodejs/cmake/../../../lib/gennodejs/gen_nodejs.py /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/Face.msg -Ipi_face_tracker:/home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg -Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg -p pi_face_tracker -o /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg

/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Faces.js: /opt/ros/noetic/lib/gennodejs/gen_nodejs.py
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Faces.js: /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/Faces.msg
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Faces.js: /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/Face.msg
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Faces.js: /opt/ros/noetic/share/geometry_msgs/msg/Point.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/workspace/BotPico/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating Javascript code from pi_face_tracker/Faces.msg"
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gennodejs/cmake/../../../lib/gennodejs/gen_nodejs.py /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg/Faces.msg -Ipi_face_tracker:/home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg -Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg -p pi_face_tracker -o /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg

/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/KeyCommand.js: /opt/ros/noetic/lib/gennodejs/gen_nodejs.py
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/KeyCommand.js: /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/srv/KeyCommand.srv
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/workspace/BotPico/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating Javascript code from pi_face_tracker/KeyCommand.srv"
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gennodejs/cmake/../../../lib/gennodejs/gen_nodejs.py /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/srv/KeyCommand.srv -Ipi_face_tracker:/home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg -Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg -p pi_face_tracker -o /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv

/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/SetROI.js: /opt/ros/noetic/lib/gennodejs/gen_nodejs.py
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/SetROI.js: /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/srv/SetROI.srv
/home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/SetROI.js: /opt/ros/noetic/share/sensor_msgs/msg/RegionOfInterest.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/workspace/BotPico/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating Javascript code from pi_face_tracker/SetROI.srv"
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gennodejs/cmake/../../../lib/gennodejs/gen_nodejs.py /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/srv/SetROI.srv -Ipi_face_tracker:/home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/msg -Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg -p pi_face_tracker -o /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv

pi_face_tracker_generate_messages_nodejs: pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs
pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/FaceEvent.js
pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Face.js
pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/msg/Faces.js
pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/KeyCommand.js
pi_face_tracker_generate_messages_nodejs: /home/pi/workspace/BotPico/devel/share/gennodejs/ros/pi_face_tracker/srv/SetROI.js
pi_face_tracker_generate_messages_nodejs: pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/build.make

.PHONY : pi_face_tracker_generate_messages_nodejs

# Rule to build all files generated by this target.
pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/build: pi_face_tracker_generate_messages_nodejs

.PHONY : pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/build

pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/clean:
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && $(CMAKE_COMMAND) -P CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/cmake_clean.cmake
.PHONY : pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/clean

pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/depend:
	cd /home/pi/workspace/BotPico/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/workspace/BotPico/src /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker /home/pi/workspace/BotPico/build /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pi_vision/pi_face_tracker/CMakeFiles/pi_face_tracker_generate_messages_nodejs.dir/depend

