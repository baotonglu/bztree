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
include CMakeFiles/bztree_pmdk_tests.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bztree_pmdk_tests.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bztree_pmdk_tests.dir/flags.make

CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.o: CMakeFiles/bztree_pmdk_tests.dir/flags.make
CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.o: ../tests/bztree_pmdk_tests.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/baotong/bztree/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.o -c /home/baotong/bztree/tests/bztree_pmdk_tests.cc

CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/baotong/bztree/tests/bztree_pmdk_tests.cc > CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.i

CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/baotong/bztree/tests/bztree_pmdk_tests.cc -o CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.s

# Object files for target bztree_pmdk_tests
bztree_pmdk_tests_OBJECTS = \
"CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.o"

# External object files for target bztree_pmdk_tests
bztree_pmdk_tests_EXTERNAL_OBJECTS =

bztree_pmdk_tests: CMakeFiles/bztree_pmdk_tests.dir/tests/bztree_pmdk_tests.cc.o
bztree_pmdk_tests: CMakeFiles/bztree_pmdk_tests.dir/build.make
bztree_pmdk_tests: libbztree.so
bztree_pmdk_tests: Release/_deps/pmwcas-src/libpmwcas.so
bztree_pmdk_tests: _deps/glog-build/libglog.a
bztree_pmdk_tests: _deps/googletest-build/googlemock/gtest/libgtest_main.a
bztree_pmdk_tests: /usr/local/lib/libpmemobj.a
bztree_pmdk_tests: /usr/local/lib/libpmemobj.so
bztree_pmdk_tests: /usr/lib/libunwind.so
bztree_pmdk_tests: _deps/googletest-build/googlemock/gtest/libgtest.a
bztree_pmdk_tests: CMakeFiles/bztree_pmdk_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/baotong/bztree/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bztree_pmdk_tests"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bztree_pmdk_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bztree_pmdk_tests.dir/build: bztree_pmdk_tests

.PHONY : CMakeFiles/bztree_pmdk_tests.dir/build

CMakeFiles/bztree_pmdk_tests.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bztree_pmdk_tests.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bztree_pmdk_tests.dir/clean

CMakeFiles/bztree_pmdk_tests.dir/depend:
	cd /home/baotong/bztree/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/baotong/bztree /home/baotong/bztree /home/baotong/bztree/Release /home/baotong/bztree/Release /home/baotong/bztree/Release/CMakeFiles/bztree_pmdk_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bztree_pmdk_tests.dir/depend

