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

# Utility rule file for _pi_face_tracker_generate_messages_check_deps_SetROI.

# Include the progress variables for this target.
include pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/progress.make

pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI:
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/genmsg/cmake/../../../lib/genmsg/genmsg_check_deps.py pi_face_tracker /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker/srv/SetROI.srv sensor_msgs/RegionOfInterest

_pi_face_tracker_generate_messages_check_deps_SetROI: pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI
_pi_face_tracker_generate_messages_check_deps_SetROI: pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/build.make

.PHONY : _pi_face_tracker_generate_messages_check_deps_SetROI

# Rule to build all files generated by this target.
pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/build: _pi_face_tracker_generate_messages_check_deps_SetROI

.PHONY : pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/build

pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/clean:
	cd /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker && $(CMAKE_COMMAND) -P CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/cmake_clean.cmake
.PHONY : pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/clean

pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/depend:
	cd /home/pi/workspace/BotPico/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/workspace/BotPico/src /home/pi/workspace/BotPico/src/pi_vision/pi_face_tracker /home/pi/workspace/BotPico/build /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker /home/pi/workspace/BotPico/build/pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pi_vision/pi_face_tracker/CMakeFiles/_pi_face_tracker_generate_messages_check_deps_SetROI.dir/depend
