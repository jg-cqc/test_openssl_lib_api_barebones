#!/bin/bash

#####################################################
# System: Quantum Origin
# Component: test_openssl_lib_api
# File: go.sh
# Description: Test of libyaml
#####################################################

# Debugging
#set -x

# Halt on error
set -e

function fnSetupConanFromScratch()
{
	####################################
	# Clean conan
	####################################
	if [ -d "${HOME}/.conan/data" ]
	then
		rm -rf "${HOME}/.conan/data"
	fi
	if [ -f "${HOME}/.conan/profiles/${CONAN_PROFILE_NAME}" ]
	then
		rm -rf "${HOME}/.conan/profiles/${CONAN_PROFILE_NAME}"
	fi

	####################################
	# Setup Conan
	####################################
	# InstallConan
	sudo apt update
	sudo apt install python3-pip
	pip install -r requirements.txt

	# Create Conan Profile
	# If it doesn't already exist, it will display the above warning, which is resolved below (2 lines down)
	if [ -f "${HOME}/.conan/profiles/${CONAN_PROFILE_NAME}" ]
	then
		cp "${HOME}/.conan/profiles/${CONAN_PROFILE_NAME}" "${HOME}/.conan/profiles/${CONAN_PROFILE_NAME}.previous"
		rm "${HOME}/.conan/profiles/${CONAN_PROFILE_NAME}"
	fi
	# Suppress the glaring red "WARNING: GCC OLD ABI COMPATIBILITY"
	export CONAN_V2_MODE=1

	conan profile new "${CONAN_PROFILE_NAME}" --detect
	conan config set general.revisions_enabled=True

	conan profile update settings.compiler.libcxx=libstdc++11 "${CONAN_PROFILE_NAME}"
	conan profile update settings.compiler.version=10 "${CONAN_PROFILE_NAME}"
	conan profile update settings.build_type="${CMAKE_BUILD_TYPE}" "${CONAN_PROFILE_NAME}"

	conan profile update env.CMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE}" "${CONAN_PROFILE_NAME}"
	conan profile update env.CMAKE_BUILD_PLATFORM="${CMAKE_BUILD_PLATFORM}" "${CONAN_PROFILE_NAME}"
	conan profile update env.CMAKE_TARGET_PLATFORM="${CMAKE_TARGET_PLATFORM}" "${CONAN_PROFILE_NAME}"
}

function fnBuildFromScratch()
{
	####################################
	# Clean Build
	####################################
	if [ -d "./build" ]
	then
		rm -rf build || true
	fi

	####################################
	# Build
	####################################
	set -e # Halt on error
	mkdir -p build
	pushd build

	# Use Conan To Build Dependencies
	conan remote add --force artifactory https://cambridgequantum.jfrog.io/artifactory/api/conan/default-conan || true
	conan install .. -s build_type="${CMAKE_BUILD_TYPE}" -pr:b="${CONAN_PROFILE_NAME}" -pr:h="${CONAN_PROFILE_NAME}" --build=missing

	# Build our app
	conan install .. --build=missing -e:b CMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE}" -e:b CMAKE_BUILD_PLATFORM="${CMAKE_BUILD_PLATFORM}" -e:b CMAKE_TARGET_PLATFORM="${CMAKE_TARGET_PLATFORM}"
	conan build ..

	popd
}

PROJECTNAME="[test_openssl_lib_api_barebones]"
TARGET_NAME=test_openssl_lib_api_barebones

CMAKE_BUILD_TYPE=Debug
#CMAKE_BUILD_TYPE=Release

CMAKE_BUILD_PLATFORM="Ubuntu_20.04"
CMAKE_TARGET_PLATFORM="Ubuntu_20.04"

#CONAN_PROFILE_NAME=default
CONAN_PROFILE_NAME="${TARGET_NAME}_${CMAKE_BUILD_PLATFORM}_${CMAKE_BUILD_TYPE}.prf"


#fnSetupConanFromScratch
fnBuildFromScratch

# Test
echo "---Test-----------------------------------------------------------------------------"
./build/bin/test_openssl_lib_api_barebones
echo "---Test-----------------------------------------------------------------------------"
