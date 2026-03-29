// PixelForge
// Copyright (C) 2025  Igara Studio S.A.
//
// This program is distributed under the terms of
// the End-User License Agreement for PixelForge.

#ifdef HAVE_CONFIG_H
  #include "config.h"
#endif

#include "app/win/file_associations.h"

#include "app/win/notify_shell.h"
#include "base/fs.h"
#include "base/win/registry.h"
#include "fmt/format.h"
#include "os/error.h"
#include "ver/info.h"

namespace app { namespace win {

using hkey = base::hkey;

static void configure_shell_open(hkey& k)
{
  hkey open = k.create("shell\\open");

  hkey command = open.create("command");
  command.string("", fmt::format("\"{}\"", base::get_app_path()));

  hkey ddeexec = open.create("ddeexec");
  ddeexec.string("", "[open(\"%1\")]");
  ddeexec.create("application").string("", "PixelForge");
  ddeexec.create("topic").string("", "system");
}

void associate_file_type_with_pixelforgefile_class(const std::string& extension)
{
  try {
    hkey hkcr = hkey::current_user().open("Software\\Classes", hkey::write);

    // HKEY_CLASSES_ROOT\.extension

    hkey k = hkcr.create(std::string(".") + extension);
    if (k.string("") != "PixelForgeFile")
      k.string("", "PixelForgeFile");

    // HKEY_CLASSES_ROOT\PixelForgeFile

    k = hkcr.create("PixelForgeFile");
    hkey icon = k.create("DefaultIcon");
    icon.string("", fmt::format("{},1", base::get_app_path()));

    configure_shell_open(k);

    notify_shell_about_association_change_regen_thumbnails();
  }
  catch (const std::exception& ex) {
    os::error_message(ex.what());
  }
}

void add_pixelforge_to_open_with_file_type(const std::string& extension)
{
  try {
    hkey hkcr = hkey::current_user().open("Software\\Classes", hkey::write);

    // HKEY_CLASSES_ROOT\.extension
    hkey k = hkcr.create(fmt::format(".{}\\OpenWithProgids", extension));
    k.string("IgaraStudio.PixelForge", "");

    // HKEY_CLASSES_ROOT\IgaraStudio.PixelForge
    k = hkcr.create("IgaraStudio.PixelForge");
    k.create("Application").string("ApplicationName", "PixelForge (running instance)");
    configure_shell_open(k);

    notify_shell_about_association_change_regen_thumbnails();
  }
  catch (const std::exception& ex) {
    os::error_message(ex.what());
  }
}

}} // namespace app::win
