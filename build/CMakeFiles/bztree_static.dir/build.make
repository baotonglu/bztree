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
CMAKE_BINARY_DIR = /home/baotong/bztree/build

# Include any dependencies generated for this target.
include CMakeFiles/bztree_static.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bztree_static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bztree_static.dir/flags.make

CMakeFiles/bztree_static.dir/bztree.cc.o: CMakeFiles/bztree_static.dir/flags.make
CMakeFiles/bztree_static.dir/bztree.cc.o: ../bztree.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/baotong/bztree/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bztree_static.dir/bztree.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bztree_static.dir/bztree.cc.o -c /home/baotong/bztree/bztree.cc

CMakeFiles/bztree_static.dir/bztree.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bztree_static.dir/bztree.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/baotong/bztree/bztree.cc > CMakeFiles/bztree_static.dir/bztree.cc.i

CMakeFiles/bztree_static.dir/bztree.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bztree_static.dir/bztree.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/baotong/bztree/bztree.cc -o CMakeFiles/bztree_static.dir/bztree.cc.s

# Object files for target bztree_static
bztree_static_OBJECTS = \
"CMakeFiles/bztree_static.dir/bztree.cc.o"

# External object files for target bztree_static
bztree_static_EXTERNAL_OBJECTS =

libbztree_static.a: CMakeFiles/bztree_static.dir/bztree.cc.o
libbztree_static.a: CMakeFiles/bztree_static.dir/build.make
libbztree_static.a: CMakeFiles/bztree_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/baotong/bztree/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libbztree_static.a"
	$(CMAKE_COMMAND) -P CMakeFiles/bztree_static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bztree_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bztree_static.dir/build: libbztree_static.a

.PHONY : CMakeFiles/bztree_static.dir/build

CMakeFiles/bztree_static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bztree_static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bztree_static.dir/clean

CMakeFiles/bztree_static.dir/depend:
	cd /home/baotong/bztree/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/baotong/bztree /home/baotong/bztree /home/baotong/bztree/build /home/baotong/bztree/build /home/baotong/bztree/build/CMakeFiles/bztree_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bztree_static.dir/depend

