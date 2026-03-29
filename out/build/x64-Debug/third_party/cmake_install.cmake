# Install script for directory: C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/zlib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libpng/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/giflib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/tinyxml2/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/TinyEXIF/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/curl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/pixman-cmake/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/freetype2/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/harfbuzz/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/simpleini/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/fmt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/json11/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libarchive/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cityhash/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/IXWebSocket/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
