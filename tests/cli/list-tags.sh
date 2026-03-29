#! /bin/bash
# Copyright (C) 2018 Igara Studio S.A.

expect "a
b" "$PIXELFORGE -b --list-tags sprites/1empty3.pixelforge"
