# Test OpenSSL v1.1 libcrypto Library API

## Description

Simple C program to test programmatic interface into OpenSSL RAND engines.

## Building
make

### Example Build Log
```
jgilmore@LAPTOP-CQC03(Ubuntu_20.04):[~/dev/learning/test_openssl_lib_api_barebones]$ make
./go.sh build
*** ./go.sh : [test_openssl_lib_api_barebones] build script ***
CMAKE_BUILD_TYPE      = Debug
CMAKE_BUILD_PLATFORM  = Ubuntu_20.04
CMAKE_TARGET_PLATFORM = Ubuntu_20.04
CONAN_PROFILE_NAME    = test_openssl_lib_api_barebones_Ubuntu_20.04_Debug.prf
CMD = build (build)
################################################################
Build [test_openssl_lib_api_barebones] - BEGIN
################################################################
    ################################################################
    # Step 1:  conan install .. --build=missing
    ################################################################
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
    libyaml/0.2.5 from 'conancenter' - Cache
    yaml-cpp/0.7.0 from 'conancenter' - Cache
Packages
    libyaml/0.2.5:19729b9559f3ae196cad45cb2b97468ccb75dcd1 - Cache
    yaml-cpp/0.7.0:b173bbda18164d49a449ffadc1c9e817f49e819d - Cache

Installing (downloading, building) binaries...
libyaml/0.2.5: Already installed!
yaml-cpp/0.7.0: Already installed!
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generator txt created conanbuildinfo.txt
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Calling generate()
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Preset 'release' added to CMakePresets.json. Invoke it manually using 'cmake --preset release'
conanfile.py (test_openssl_lib_api_barebones/0.1.0): If your CMake version is not compatible with CMakePresets (<3.19) call cmake like: 'cmake <path> -G Ninja -DCMAKE_TOOLCHAIN_FILE=/mnt/c/Users/jgilmore/dev/learning/test_openssl_lib_api_barebones/build/conan_toolchain.cmake -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_BUILD_TYPE=Release'
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Aggregating env generators
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generated conaninfo.txt
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Generated graphinfo
    ################################################################
    # Step 2:   conan build ..
    ################################################################
Using lockfile: '/mnt/c/Users/jgilmore/dev/learning/test_openssl_lib_api_barebones/build/conan.lock'
Using cached profile from lockfile
conanfile.py (test_openssl_lib_api_barebones/0.1.0): Calling build()
conanfile.py (test_openssl_lib_api_barebones/0.1.0): CMake command: cmake -G "Ninja" -DCMAKE_TOOLCHAIN_FILE="/mnt/c/Users/jgilmore/dev/learning/test_openssl_lib_api_barebones/build/conan_toolchain.cmake" -DCMAKE_INSTALL_PREFIX="/mnt/c/Users/jgilmore/dev/learning/test_openssl_lib_api_barebones/build/package" -DCMAKE_POLICY_DEFAULT_CMP0091="NEW" -DCMAKE_BUILD_TYPE="Release" "/mnt/c/Users/jgilmore/dev/learning/test_openssl_lib_api_barebones"
-- Conan: Target declared 'yaml'
-- Using Conan toolchain: /home/jgilmore/dev/learning/test_openssl_lib_api_barebones/build/conan_toolchain.cmake
-- Conan toolchain: Setting CMAKE_POSITION_INDEPENDENT_CODE=ON (options.fPIC)
-- Conan toolchain: Setting BUILD_SHARED_LIBS = ON
Compiler Version: GNU
Compiler Version: 10.3.0
-- PROJECT_SOURCE_DIR = /home/jgilmore/dev/learning/test_openssl_lib_api_barebones
-- CMAKE_CURRENT_SOURCE_DIR = /home/jgilmore/dev/learning/test_openssl_lib_api_barebones
-- CMAKE_BINARY_DIR = /home/jgilmore/dev/learning/test_openssl_lib_api_barebones/build
-- HOST SYSTEM PROCESSOR: x86_64
-- SYSTEM PROCESSOR: x86_64
-- C FLAGS: -m64 -Wall -Werror -Werror=sign-conversion -O3
-- CXX FLAGS: -m64 -Wall -Werror -Werror=sign-conversion -O3
-- BUILD TYPE: Release
-- Building: test_openssl_lib_api_barebones.c
-- Configuring done
-- Generating done
-- Build files have been written to: /home/jgilmore/dev/learning/test_openssl_lib_api_barebones/build
conanfile.py (test_openssl_lib_api_barebones/0.1.0): CMake command: cmake --build "/mnt/c/Users/jgilmore/dev/learning/test_openssl_lib_api_barebones/build" '--' '-j12'
ninja: no work to do.
################################################################
Build [test_openssl_lib_api_barebones] - END
################################################################
--- Done
*** [test_openssl_lib_api_barebones] build Done
*** [test_openssl_lib_api_barebones] all Done
jgilmore@LAPTOP-CQC03(Ubuntu_20.04):[~/dev/learning/test_openssl_lib_api_barebones]$
```

## Usage


## Testing

### No engine support (OpenSSL Default)

```
$ ./build/bin/test_openssl_lib_api_barebones
        Using engine: <default>
                Using default engine(s)... (maybe none?)
        Calling RAND_status()
                Status: Generator is in good working order
        Calling RAND_bytes()
        RESULT: RAND_bytes [64 bytes]:
                DB C7 19 BF 15 79 A1 C7 59 22 65 49 10 8F 7E FB
                7D 03 36 FA 97 1A B8 06 17 F1 F3 80 81 37 E7 D9
                48 22 D5 16 F1 FB 4E 4F A4 C1 3A 1B 20 0C 19 4B
                43 7A E6 A4 12 C0 0D 29 7D 51 4A BF D6 65 90 B1

        Calling RAND_cleanup()
$
```

### RDRand (built-in engine)
```
$ ./build/bin/test_openssl_lib_api_barebones rdrand
        Using engine: rdrand
                Loading rdrand engine...
                        Calling ENGINE_load_rdrand()
                Calling ENGINE_by_id(rdrand)
                Calling ENGINE_init()
                Calling ENGINE_set_default(pEngine, ENGINE_METHOD_RAND)
        Calling RAND_status()
                Status: Generator is in good working order
        Calling RAND_bytes()
        RESULT: RAND_bytes [64 bytes]:
                FF 46 D1 94 73 A4 8B B8 20 CA 2D 2E 22 0F 3E 39
                21 C9 2C DF 3D D7 B9 A7 3B F9 6C 5F 1F 80 A1 0D
                42 0F 0F AF 43 6A 36 29 EC 72 29 22 58 FC F7 E7
                99 30 2D B2 AF D7 14 43 C3 BF 57 18 45 A5 86 4A

        Calling RAND_cleanup()
$
```

### QORand (Quantum Origin Engine)
```
$ ./build/bin/test_openssl_lib_api_barebones qorand_engine
        Using engine: qorand_engine
                Loading other engine(s)...
                        Calling ENGINE_load_builtin_engines()
                        Calling ENGINE_register_all_complete()
                Calling ENGINE_by_id(qorand_engine)
[QO-RAND] INFO: Binding engine: qorand_engine "Quantum Origin Randomness Engine v0.3.0 (29-Mar-2023)"
                Calling ENGINE_init()
                Calling ENGINE_set_default(pEngine, ENGINE_METHOD_RAND)
        Calling RAND_status()
                Status: Generator is in good working order
        Calling RAND_bytes()
        RESULT: RAND_bytes [64 bytes]:
                50 64 0B CD F1 79 C2 F8 15 56 6F FD 79 B0 57 ED
                F3 6F B6 19 B3 A0 D2 5B 4B 88 B4 63 36 8A D0 46
                47 C7 96 DD D3 62 E7 5F 09 20 D1 C4 51 7B B4 C0
                14 B7 CF D0 E9 21 62 D2 0B C9 07 22 EC 4F 6B AD

        Calling RAND_cleanup()
[QO-RAND] INFO: Session totals: Requests=1, BytesRequested=64, BytesSupplied=64
$
```

### Invalid/non-existent Engine
```
$ ./build/bin/test_openssl_lib_api_barebones aaa
        Using engine: aaa
                Loading other engine(s)...
                        Calling ENGINE_load_builtin_engines()
                        Calling ENGINE_register_all_complete()
                Calling ENGINE_by_id(aaa)
                        ERROR: ENGINE_by_id failed with errorcode=0x25066067
$
```

