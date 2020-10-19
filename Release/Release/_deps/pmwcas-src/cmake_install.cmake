# Install script for directory: /home/baotong/bztree/Release/_deps/pmwcas-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/baotong/bztree/Release/_deps/googletest-build/cmake_install.cmake")
  include("/home/baotong/bztree/Release/_deps/glog-build/cmake_install.cmake")
  include("/home/baotong/bztree/Release/_deps/gflags-build/cmake_install.cmake")
  include("/home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/util/cmake_install.cmake")
  include("/home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/environment/cmake_install.cmake")
  include("/home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/common/cmake_install.cmake")
  include("/home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/benchmarks/cmake_install.cmake")
  include("/home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/mwcas/cmake_install.cmake")
  include("/home/baotong/bztree/Release/Release/_deps/pmwcas-src/src/double-linked-list/cmake_install.cmake")

endif()

