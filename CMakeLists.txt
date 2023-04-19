
cmake_minimum_required(VERSION 3.20)

##################################
# Project Settings
##################################

set(TARGET_NAME "test_openssl_lib_api_barebones")
project(test_openssl_lib_api_barebones VERSION 0.3.0 LANGUAGES C CXX)
find_package(OpenSSL REQUIRED)

##################################
# Compiler Settings
##################################

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -Werror=sign-conversion")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -Werror=sign-conversion")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

if (PROFILE)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -pg")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -pg")
endif()

string(APPEND CMAKE_C_FLAGS " -O0 -fsanitize=address")
string(APPEND CMAKE_CXX_FLAGS " -O0 -fsanitize=address")
string(APPEND CMAKE_C_FLAGS " -fsanitize=leak")
string(APPEND CMAKE_CXX_FLAGS " -fsanitize=leak")

if (CMAKE_BUILD_TYPE STREQUAL "Release")
    string(APPEND CMAKE_C_FLAGS " -O3")
    string(APPEND CMAKE_CXX_FLAGS " -O3")
endif ()


# Print some compiler info
message("Compiler Version: ${CMAKE_CXX_COMPILER_ID}")
message("Compiler Version: ${CMAKE_CXX_COMPILER_VERSION}")
if (CMAKE_COMPILER_IS_GNUCC AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 10.0)
    message(FATAL_ERROR "Require at least gcc-10.0")
endif()


##################################
# CMake Settings
##################################
#set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

option(EXPORT "Enable exporting (Windows only)" ON)
if(EXPORT)
    add_compile_definitions(_EXPORTING)
endif(EXPORT)


##################################
# Project Settings
##################################


##################################
# Progress messages
##################################

message(STATUS "PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message(STATUS "HOST SYSTEM PROCESSOR: ${CMAKE_HOST_SYSTEM_PROCESSOR}")
message(STATUS "SYSTEM PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "C FLAGS: ${CMAKE_C_FLAGS}")
message(STATUS "CXX FLAGS: ${CMAKE_CXX_FLAGS}")
message(STATUS "BUILD TYPE: ${CMAKE_BUILD_TYPE}")

##################################
# Target
##################################
# The version number.
set(${TARGET_NAME}_VERSION_MAJOR 0)
set(${TARGET_NAME}_VERSION_MINOR 3)
set(${TARGET_NAME}_VERSION_RELEASE 0)

set(PROJECT_SOURCE_FILES test_openssl_lib_api_barebones.c)

message(STATUS "Building: ${PROJECT_SOURCE_FILES}")
#add_library(${TARGET_NAME} SHARED ${PROJECT_SOURCE_FILES})
#add_library(${TARGET_NAME} STATIC ${PROJECT_SOURCE_FILES})
add_executable(${TARGET_NAME} ${PROJECT_SOURCE_FILES})

#target_compile_features(${TARGET_NAME} PRIVATE cxx_std_14) # or PUBLIC if you use C++14 in headers.

##################################
# Inputs
##################################
target_include_directories(${TARGET_NAME}
                           PUBLIC
                               ${yaml_INCLUDE_DIRS}
                               ${CMAKE_CURRENT_SOURCE_DIR}/include
                          )

target_link_libraries(${TARGET_NAME}
#                           ssl
                           crypto
                     )

##################################
# Outputs
##################################
set_target_properties(${TARGET_NAME} PROPERTIES NO_SONAME 1  PREFIX "")

set_target_properties(${TARGET_NAME} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set_target_properties(${TARGET_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set_target_properties(${TARGET_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

##################################
# Install
##################################
install(TARGETS ${TARGET_NAME} RUNTIME DESTINATION bin)
