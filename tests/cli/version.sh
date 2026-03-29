#! /bin/bash
# Copyright (C) 2018 Igara Studio S.A.

if ! $PIXELFORGE --version | grep "PixelForge 1\\." > /dev/null ; then
    echo "FAILED: --version doesn't include 'PixelForge 1.' string"
    exit 1
fi
