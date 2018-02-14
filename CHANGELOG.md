# Changelog

## v0.6.0-dev

  * Updated Dependencies
    * [nerves_system_br v0.17.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v0.17.0)
    * [nerves_toolchain v0.13.1](https://github.com/nerves-project/toolchains/releases/tag/v0.13.1)
    * [nerves v0.10.0](https://github.com/nerves-project/nerves/releases/tag/v0.10.0)
  * Enhancements
    * Use QtWebEngine instead of QtWebKit
    * Added Socat for use connecting to the chromium remote debugger

## v0.5.0

  * Updated Dependencies
    * [nerves_toolchain v0.12.1](https://github.com/nerves-project/toolchains/releases/tag/v0.12.1)
  * Bug Fixes
    * Use linuxfb backend for Qt
    * Disable libglib2 to try to fix segfault issues with Qt

## v0.4.0

  * Updated to sync with upstream x86 machine
  * Bug Fixes
    * Able to identify the correct drive paths.
    * Uses the eglfs qt backend which will query the display size properly

