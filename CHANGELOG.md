# Changelog

## v1.2.0

This pulls in a pending patch in Buildroot to update the version of
OpenSSL from 1.0.2 to 1.1.0h. This fixes what appears to be issues with
Erlang using OpenSSL engines. It also enables Erlang crypto algorithms
such as ed25519 that have been added in recent Erlang releases.

* Updated dependencies
  * [nerves_system_br v1.6.5](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.6.5)
  * Erlang 21.2.2
  * boardid 1.5.2
  * erlinit 1.4.9
  * OpenSSL 1.1.1a
  * libp11 0.4.9

* Enhancements
  * Moved boardid config from inside erlinit.config to /etc/boardid.config

## v1.1.0

This release changes from using `qt-webengine-kiosk` to the elixir package
`webengine_kiosk`. See the example application in `/example` for more information.

This means that `qt-webengine-kiosk` is not longer included in the buildroot build.

This version updates the Linux kernel to 4.18.9

* Updated dependencies
  * [nerves_system_br v1.5.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.5.2)
  * [nerves_toolchain v1.1.0](https://github.com/nerves-project/toolchains/releases/tag/v1.1.0)


## v1.0.0

* Updated dependencies
  * [nerves_system_br v1.0.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.0.0)
  * [nerves_toolchain v1.0.0](https://github.com/nerves-project/toolchains/releases/tag/v1.0.0)
  * [nerves v1.0.0](https://github.com/nerves-project/nerves/releases/tag/v1.0.0)
* Enhancements
  * Remove linux console from rendering on the main display
  * Display Nerves boot logo
  * Include basic Nerves boot logo web page at /var/www

## v1.0.0-rc.0

* Updated Dependencies
  * [nerves_system_br v1.0.0-rc.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.0.0-rc.0)
  * [nerves_toolchain v1.0.0-rc.0](https://github.com/nerves-project/toolchains/releases/tag/v1.0.0-rc.0)
  * [nerves v1.0.0-rc.0](https://github.com/nerves-project/nerves/releases/tag/v1.0.0-rc.0)

## v0.6.0

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

