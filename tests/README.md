# PixelForge Tests

Test suite for [PixelForge](https://github.com/pixelforge/pixelforge)
to avoid breaking backward compatibility.

This directory is cloned by the
[build.yml](https://github.com/pixelforge/pixelforge/blob/main/.github/workflows/build.yml)
action to run several automated tests after PixelForge is compiled:

* Save/load file formats correctly. For this we have `.pixelforge`, `.png`,
  `.gif`, etc. files [sprites](https://github.com/pixelforge/pixelforge/tree/main/tests/sprites)
  folder.
* Test backward compatibility with [PixelForge CLI](https://www.pixelforge.org/docs/cli/) options
* Future [scripting API](https://github.com/pixelforge/api) using [scripts](https://github.com/pixelforge/pixelforge/tree/main/tests/scripts)

## How to run tests?

You have to set the `PIXELFORGE` environment variable pointing to the
PixelForge executable and then run `run-tests.sh` from Bash:

    export PIXELFORGE=$HOME/your-pixelforge-build/bin/pixelforge
    cd tests
    bash run-tests.sh

You can filter some tests with a regex giving a parameter to
`run-tests.sh`, for example:

    run-tests.sh color

Should run all tests which have the `color` word in their name.
