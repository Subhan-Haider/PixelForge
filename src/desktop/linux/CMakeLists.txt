# Desktop Integration
# Copyright (C) 2016 Gabriel Rauter

# Desktop shortcut
install(FILES pixelforge.desktop DESTINATION share/applications)

# GNOME Thumbnailer
install(FILES mime/pixelforge.xml DESTINATION share/mime/packages)
install(PROGRAMS pixelforge-thumbnailer DESTINATION bin)
install(FILES gnome/pixelforge.thumbnailer DESTINATION share/thumbnailers)

# Qt Thumbnailer
if(ENABLE_QT_THUMBNAILER)
  add_subdirectory(kde)
endif()
