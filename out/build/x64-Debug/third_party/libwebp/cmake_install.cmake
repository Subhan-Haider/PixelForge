# Install script for directory: C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/src/libwebpdecoder.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/src/libwebp.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/src/demux/libwebpdemux.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/src/mux/libwebpmux.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/lib/webpdecoder.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/decode.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/lib/webp.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/decode.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/encode.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/lib/webpdemux.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/decode.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/demux.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/mux_types.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/lib/webpmux.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/webp" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/mux.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/mux_types.h"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/third_party/libwebp/src/webp/types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets.cmake"
         "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/CMakeFiles/Export/3dd5097d708f2adcdf4871ccc089782a/WebPTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/WebP/cmake/WebPTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/WebP/cmake" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/CMakeFiles/Export/3dd5097d708f2adcdf4871ccc089782a/WebPTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/WebP/cmake" TYPE FILE FILES "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/CMakeFiles/Export/3dd5097d708f2adcdf4871ccc089782a/WebPTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/WebP/cmake" TYPE FILE FILES
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/WebPConfigVersion.cmake"
    "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/WebPConfig.cmake"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/setup/OneDrive/Pictures/aaaaaaaaaaaaa/out/build/x64-Debug/third_party/libwebp/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
