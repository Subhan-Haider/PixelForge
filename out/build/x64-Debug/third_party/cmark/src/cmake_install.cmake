# Install script for directory: C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/cmark/src

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/lib/cmark.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/libcmark.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/cmark/src/cmark.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/cmark_export.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/cmark_version.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/generated/cmark-config.cmake"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/generated/cmark-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark/cmark-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark/cmark-targets.cmake"
         "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/CMakeFiles/Export/fccc7afb0bf4c34e18a1be84d1a11cfd/cmark-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark/cmark-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark/cmark-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/CMakeFiles/Export/fccc7afb0bf4c34e18a1be84d1a11cfd/cmark-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/cmark" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/CMakeFiles/Export/fccc7afb0bf4c34e18a1be84d1a11cfd/cmark-targets-debug.cmake")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/cmark/src/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
