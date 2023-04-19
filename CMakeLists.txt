
cmake_minimum_required(VERSION 3.20)

# Project Settings
set(TARGET_NAME "test_openssl_lib_api_barebones")
project(test_openssl_lib_api_barebones VERSION 0.3.0 LANGUAGES C CXX)
find_package(OpenSSL REQUIRED)

# Compiler Settings
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -Werror=sign-conversion")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -Werror=sign-conversion")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
if (PROFILE)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -pg")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -pg")
endif()
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    string(APPEND CMAKE_C_FLAGS " -O0 -fsanitize=address")
    string(APPEND CMAKE_CXX_FLAGS " -O0 -fsanitize=address")
    string(APPEND CMAKE_C_FLAGS " -fsanitize=leak")
    string(APPEND CMAKE_CXX_FLAGS " -fsanitize=leak")
endif ()
if (CMAKE_BUILD_TYPE STREQUAL "Release")
    string(APPEND CMAKE_C_FLAGS " -O3")
    string(APPEND CMAKE_CXX_FLAGS " -O3")
endif ()

if (CMAKE_COMPILER_IS_GNUCC AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 10.0)
    message(FATAL_ERROR "Require at least gcc-10.0")
endif()

# CMake Settings
set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Target
set(${TARGET_NAME}_VERSION_MAJOR 1)
set(${TARGET_NAME}_VERSION_MINOR 0)
set(${TARGET_NAME}_VERSION_RELEASE 0)

set(PROJECT_SOURCE_FILES test_openssl_lib_api_barebones.c)
add_executable(${TARGET_NAME} ${PROJECT_SOURCE_FILES})
target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include )
target_link_libraries(${TARGET_NAME} crypto )
set_target_properties(${TARGET_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
