// PixelForge
// Copyright (c) 2024-2025  Igara Studio S.A.
//
// This program is distributed under the terms of
// the End-User License Agreement for PixelForge.

#include "tests/app_test.h"

#include "app/fonts/font_info.h"

using namespace app;
using namespace std::literals;

namespace app {

std::ostream& operator<<(std::ostream& os, const FontInfo& info)
{
  return os << base::convert_to<std::string>(info);
}

} // namespace app

TEST(FontInfo, ByName)
{
  FontInfo a(FontInfo::Type::Name, "PixelForge");
  FontInfo b(FontInfo::Type::Name, "PixelForge", 24);
  FontInfo c(FontInfo::Type::Name, "Arial Unicode");
  EXPECT_EQ("PixelForge", base::convert_to<std::string>(a));
  EXPECT_EQ("PixelForge,size=24", base::convert_to<std::string>(b));
  EXPECT_EQ("Arial Unicode", base::convert_to<std::string>(c));

  EXPECT_EQ(a, base::convert_to<FontInfo>("PixelForge"s));
  EXPECT_EQ(b, base::convert_to<FontInfo>("PixelForge,size=24"s));
  EXPECT_EQ(c, base::convert_to<FontInfo>("Arial Unicode"s));
}

TEST(FontInfo, ByFile)
{
  FontInfo a(FontInfo::Type::File, "C:/Windows/fonts/Arial.ttf", 12);
  FontInfo b(FontInfo::Type::File, "/usr/share/fonts/truetype/noto/NotoSansMath-Regular.ttf");
  EXPECT_EQ("file=C:/Windows/fonts/Arial.ttf,size=12", base::convert_to<std::string>(a));
  EXPECT_EQ("file=/usr/share/fonts/truetype/noto/NotoSansMath-Regular.ttf",
            base::convert_to<std::string>(b));

  EXPECT_EQ(a, base::convert_to<FontInfo>("file=C:/Windows/fonts/Arial.ttf,size=12"s));
  EXPECT_EQ(
    b,
    base::convert_to<FontInfo>("file=/usr/share/fonts/truetype/noto/NotoSansMath-Regular.ttf"s));
}

TEST(FontInfo, BySystem)
{
  FontInfo a(FontInfo::Type::System, "FreeMono");
  FontInfo b(FontInfo::Type::System,
             "DejaVu Serif",
             12,
             text::FontStyle(),
             FontInfo::Flags::Antialias);
  FontInfo c(FontInfo::Type::System, "Arial", 14, text::FontStyle::Bold());
  FontInfo d(FontInfo::Type::System, "Arial", 16, text::FontStyle::BoldItalic());
  EXPECT_EQ("system=FreeMono", base::convert_to<std::string>(a));
  EXPECT_EQ("system=DejaVu Serif,size=12,antialias", base::convert_to<std::string>(b));
  EXPECT_EQ("system=Arial,size=14,bold", base::convert_to<std::string>(c));
  EXPECT_EQ("system=Arial,size=16,bold,italic", base::convert_to<std::string>(d));

  EXPECT_EQ(a, base::convert_to<FontInfo>("system=FreeMono"s));
  EXPECT_EQ(b, base::convert_to<FontInfo>("system=DejaVu Serif,size=12,antialias"s));
  EXPECT_EQ(c, base::convert_to<FontInfo>("system=Arial,size=14,bold"s));
  EXPECT_EQ(d, base::convert_to<FontInfo>("system=Arial,size=16,bold,italic"s));
}
