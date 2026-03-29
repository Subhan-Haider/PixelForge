# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project")
  file(MAKE_DIRECTORY "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project")
endif()
file(MAKE_DIRECTORY
  "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project-build"
  "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo"
  "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/tmp"
  "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project-stamp"
  "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src"
  "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/libjpeg-turbo/src/libjpeg-turbo-project-stamp${cfgdir}") # cfgdir has leading slash
endif()
