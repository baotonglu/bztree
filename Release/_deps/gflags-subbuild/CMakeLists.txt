# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.18.2)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(gflags-populate NONE)

include(ExternalProject)
ExternalProject_Add(gflags-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/gflags/gflags.git" "GIT_TAG" "v2.2.2"
                    SOURCE_DIR          "/home/baotong/bztree/Release/_deps/gflags-src"
                    BINARY_DIR          "/home/baotong/bztree/Release/_deps/gflags-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


