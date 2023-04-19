#import re
from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, CMakeDeps
#from conan.tools.files import save, load
#from conan.tools.gnu import AutotoolsToolchain, AutotoolsDeps
#from conan.tools.microsoft import unix_path, VCVars, is_msvc
#from conan.errors import ConanInvalidConfiguration
#from conan.errors import ConanException


class yaml_test_Conan(ConanFile):
    name = "test_openssl_lib_api_barebones"
    version = "0.1.0"
#    url = "https://github.com/CQCL-DEV/IronBridge.OpenSSLEngine.QORand.git"
    description = "Test libyaml"
    # NOTE: It seems that multiple requires statements are not supported. Keep everything in a single requires clause.
    #       Can also optionally use suffix of local_builds e.g. "qo_decrypt/1.33.0@local_builds"
#    requires = \
#               "libcrypto/1.1"


    # Binary configuration
    settings = "os", "compiler", "build_type", "arch"

    options         = { "shared"        : [True, False],  # Build a shared library
                        "fPIC"          : [True, False]  # Generate position-independent code
                      }
    default_options = { "shared"        : True,
                        "fPIC"          : True
                      }

    # Sources are located in the same place as this recipe, copy them to the recipe
    exports_sources = "CMakeLists.txt", "src/*", "include/*"

#    def set_version(self):
#        git = tools.Git(folder=self.recipe_folder)
#        git_tag = git.run("describe --tags")
#        match = re.match("^v([0-9]+).([0-9]+).([0-9]+)(-([0-9]+)-g([0-9a-z]+))?$", git_tag)
#        if match:
#            self.version = "%s.%s.%s" % match.group(1, 2, 3)
#        else:
#            self.version = "0.0.0"

    def generate(self):
        cmake = CMakeToolchain(self, generator="Ninja")
        cmake.variables["CMAKE_BUILD_TYPE"] = self.settings.build_type
        cmake.generate()

        deps = CMakeDeps(self)
        deps.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()

#    def package_info(self):
#        self.cpp_info.libs = ["qorand_engine"]
