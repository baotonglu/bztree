# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/baotong/bztree

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/baotong/bztree/Release

# Include any dependencies generated for this target.
include Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/depend.make

# Include the progress variables for this target.
include Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/progress.make

# Include the compile flags for this target's objects.
include Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/flags.make

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/epoch_test.cc.o: Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/flags.make
Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/epoch_test.cc.o: _deps/pmwcas-src/src/common/epoch_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/baotong/bztree/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/epoch_test.cc.o"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/epoch_test.dir/epoch_test.cc.o -c /home/baotong/bztree/Release/_deps/pmwcas-src/src/common/epoch_test.cc

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/epoch_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/epoch_test.dir/epoch_test.cc.i"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/baotong/bztree/Release/_deps/pmwcas-src/src/common/epoch_test.cc > CMakeFiles/epoch_test.dir/epoch_test.cc.i

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/epoch_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/epoch_test.dir/epoch_test.cc.s"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/baotong/bztree/Release/_deps/pmwcas-src/src/common/epoch_test.cc -o CMakeFiles/epoch_test.dir/epoch_test.cc.s

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.o: Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/flags.make
Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.o: _deps/pmwcas-src/src/environment/environment_linux.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/baotong/bztree/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.o"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.o -c /home/baotong/bztree/Release/_deps/pmwcas-src/src/environment/environment_linux.cc

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.i"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/baotong/bztree/Release/_deps/pmwcas-src/src/environment/environment_linux.cc > CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.i

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.s"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/baotong/bztree/Release/_deps/pmwcas-src/src/environment/environment_linux.cc -o CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.s

# Object files for target epoch_test
epoch_test_OBJECTS = \
"CMakeFiles/epoch_test.dir/epoch_test.cc.o" \
"CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.o"

# External object files for target epoch_test
epoch_test_EXTERNAL_OBJECTS =

Release/_deps/pmwcas-src/src/common/epoch_test: Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/epoch_test.cc.o
Release/_deps/pmwcas-src/src/common/epoch_test: Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/__/environment/environment_linux.cc.o
Release/_deps/pmwcas-src/src/common/epoch_test: Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/build.make
Release/_deps/pmwcas-src/src/common/epoch_test: _deps/glog-build/libglog.a
Release/_deps/pmwcas-src/src/common/epoch_test: Release/_deps/pmwcas-src/libpmwcas.so
Release/_deps/pmwcas-src/src/common/epoch_test: _deps/glog-build/libglog.a
Release/_deps/pmwcas-src/src/common/epoch_test: _deps/googletest-build/googlemock/gtest/libgtest_main.a
Release/_deps/pmwcas-src/src/common/epoch_test: Release/_deps/pmwcas-src/src/double-linked-list/libdouble-linked-list.a
Release/_deps/pmwcas-src/src/common/epoch_test: /usr/local/lib/libpmemobj.so
Release/_deps/pmwcas-src/src/common/epoch_test: _deps/googletest-build/googlemock/gtest/libgtest.a
Release/_deps/pmwcas-src/src/common/epoch_test: _deps/glog-build/libglog.a
Release/_deps/pmwcas-src/src/common/epoch_test: /usr/lib/libunwind.so
Release/_deps/pmwcas-src/src/common/epoch_test: Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/baotong/bztree/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable epoch_test"
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/epoch_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/build: Release/_deps/pmwcas-src/src/common/epoch_test

.PHONY : Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/build

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/clean:
	cd /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common && $(CMAKE_COMMAND) -P CMakeFiles/epoch_test.dir/cmake_clean.cmake
.PHONY : Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/clean

Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/depend:
	cd /home/baotong/bztree/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/baotong/bztree /home/baotong/bztree/Release/_deps/pmwcas-src/src/common /home/baotong/bztree/Release /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common /home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Release/_deps/pmwcas-src/src/common/CMakeFiles/epoch_test.dir/depend

