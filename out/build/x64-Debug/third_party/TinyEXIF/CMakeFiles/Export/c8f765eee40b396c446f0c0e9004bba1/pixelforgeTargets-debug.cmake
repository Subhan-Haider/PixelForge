#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "TinyEXIFstatic" for configuration "Debug"
set_property(TARGET TinyEXIFstatic APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(TinyEXIFstatic PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/TinyEXIFd.lib"
  )

list(APPEND _cmake_import_check_targets TinyEXIFstatic )
list(APPEND _cmake_import_check_files_for_TinyEXIFstatic "${_IMPORT_PREFIX}/lib/TinyEXIFd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
