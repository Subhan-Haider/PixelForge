#! /bin/bash
# Copyright (C) 2018 Igara Studio S.A.

if ! $PIXELFORGE --help | grep "\\-\\-help" > /dev/null ; then
    echo "FAILED: --help doesn't include usage information"
    exit 1
fi
