// PixelForge Desktop Integration Module
// Copyright (C) 2016  Gabriel Rauter
//
// Licensed under the the MIT License (https://opensource.org/licenses/MIT).

#ifndef _PIXELFORGE_THUMBCREATOR_H_
#define _PIXELFORGE_THUMBCREATOR_H_
#pragma once

#include <QLoggingCategory>
Q_DECLARE_LOGGING_CATEGORY(LOG_PIXELFORGE_THUMBCREATOR)

#include <kio/thumbcreator.h>

class PixelForgeThumbCreator : public ThumbCreator {
public:
  bool create(const QString& path, int width, int height, QImage& img) override;
  Flags flags() const override;
};

#endif
