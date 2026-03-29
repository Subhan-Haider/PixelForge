#! /bin/bash
# Copyright (C) 2018 Igara Studio S.A.

expect "bg
fg" "$PIXELFORGE -b --list-layers sprites/1empty3.pixelforge"

expect "a
b
c
d" "$PIXELFORGE -b --list-layers sprites/abcd.pixelforge"
