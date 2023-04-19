# Test OpenSSL v1.1 libcrypto Library API (Bare Bones version)

## Description

Simple C program to test programmatic interface into OpenSSL RAND engines.

## Building
make

### Example Build Log
```
$ make
./go.sh
/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build /mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones
Configuration (profile_host):
[settings]
arch=x86_64
arch_build=x86_64
build_type=Debug
compiler=gcc
compiler.libcxx=libstdc++11
compiler.version=10
os=Linux
os_build=Linux
[options]
[build_requires]
[env]
CMAKE_BUILD_PLATFORM=Ubuntu_20.04
CMAKE_BUILD_TYPE=Debug
CMAKE_TARGET_PLATFORM=Ubuntu_20.04
Configuration (profile_build):
[settings]
arch=x86_64
arch_build=x86_64
build_type=Debug
compiler=gcc
compiler.libcxx=libstdc++11
compiler.version=10
os=Linux
os_build=Linux
[options]
[build_requires]
[env]
CMAKE_BUILD_PLATFORM=Ubuntu_20.04
CMAKE_BUILD_TYPE=Debug
CMAKE_TARGET_PLATFORM=Ubuntu_20.04
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Installing package
Requirements
Packages

Installing (downloading, building) binaries...
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generator txt created conanbuildinfo.txt
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Calling generate()
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Preset 'debug' added to CMakePresets.json. Invoke it manually using 'cmake --preset debug'
conanfile.py (test_openssl_lib_api_barebones/0.1.0): If your CMake version is not compatible with CMakePresets (<3.19) call cmake like: 'cmake <path> -G Ninja -DCMAKE_TOOLCHAIN_FILE=/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build/conan_toolchain.cmake -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_BUILD_TYPE=Debug'
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Aggregating env generators
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generated conaninfo.txt
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generated graphinfo
Configuration (profile_host):
[settings]
arch=x86_64
arch_build=x86_64
build_type=Release
compiler=gcc
compiler.libcxx=libstdc++11
compiler.version=10
os=Linux
os_build=Linux
[options]
[build_requires]
[env]

Configuration (profile_build):
[settings]
arch=x86_64
arch_build=x86_64
build_type=Release
compiler=gcc
compiler.libcxx=libstdc++11
compiler.version=10
os=Linux
os_build=Linux
[options]
[build_requires]
[env]
CMAKE_BUILD_PLATFORM=Ubuntu_20.04
CMAKE_BUILD_TYPE=Debug
CMAKE_TARGET_PLATFORM=Ubuntu_20.04
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Installing package
Requirements
Packages

Installing (downloading, building) binaries...
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generator txt created conanbuildinfo.txt
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Calling generate()
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Preset 'release' added to CMakePresets.json. Invoke it manually using 'cmake --preset release'
conanfile.py (test_openssl_lib_api_barebones/0.1.0): If your CMake version is not compatible with CMakePresets (<3.19) call cmake like: 'cmake <path> -G Ninja -DCMAKE_TOOLCHAIN_FILE=/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build/conan_toolchain.cmake -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_BUILD_TYPE=Release'
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Aggregating env generators
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generated conaninfo.txt
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generated graphinfo
Using lockfile: '/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build/conan.lock'
Using cached profile from lockfile
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Calling build()
conanfile.py (test_openssl_lib_api_barebones/0.1.0): CMake command: cmake -G "Ninja" -DCMAKE_TOOLCHAIN_FILE="/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build/conan_toolchain.cmake" -DCMAKE_INSTALL_PREFIX="/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build/package" -DCMAKE_POLICY_DEFAULT_CMP0091="NEW" -DCMAKE_BUILD_TYPE="Release" "/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones"
-- Using Conan toolchain: /mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build/conan_toolchain.cmake
-- Conan toolchain: Setting CMAKE_POSITION_INDEPENDENT_CODE=ON (options.fPIC)
-- Conan toolchain: Setting BUILD_SHARED_LIBS = ON
-- The C compiler identification is GNU 10.3.0
-- The CXX compiler identification is GNU 10.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found OpenSSL: /usr/lib/x86_64-linux-gnu/libcrypto.so (found version "1.1.1f")
-- Configuring done (12.3s)
-- Generating done (0.0s)
CMake Warning:
  Manually-specified variables were not used by the project:

    CMAKE_POLICY_DEFAULT_CMP0091


-- Build files have been written to: /mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build
conanfile.py (test_openssl_lib_api_barebones/0.1.0): CMake command: cmake --build "/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones/build" '--' '-j12'
[2/2] Linking C executable bin/test_openssl_lib_api_barebones
/mnt/c/Users/user1/dev/github/github_user1/test_openssl_lib_api_barebones
---Test-----------------------------------------------------------------------------
[QO-RAND] INFO: Binding engine: qorand_engine "Quantum Origin Randomness Engine v0.3.0 (29-Mar-2023)"
Randomness received [64 bytes]: 30A470C511159962E4FB20C56A7B02D44985A164330909EEA46DD934F15DCEF74FEE7D77519AB0CAF43728733B22E3825C15F84A833AA78EAC302FE0731231C7
[QO-RAND] INFO: Session totals: Requests=1, BytesRequested=64, BytesSupplied=64
---Test-----------------------------------------------------------------------------
*** [test_openssl_lib_api_barebones] all Done
$
```

## Usage

```
test_openssl_lib_api_barebones
```
i.e. no parameters needed

## Testing

```
$ ./build/bin/test_openssl_lib_api_barebones
[QO-RAND] INFO: Binding engine: qorand_engine "Quantum Origin Randomness Engine v0.3.0 (29-Mar-2023)"
Randomness received [64 bytes]: BA2A4B0AF07604E122A4E99B208429F7F47A42741640E5D956377E01E4BB4D89134ECFAECDAA6EC8BEF72C6B7E35EEE55B068ABF4CEC077BA6DBDCBB6FE06558
[QO-RAND] INFO: Session totals: Requests=1, BytesRequested=64, BytesSupplied=64
$
```

