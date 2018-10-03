# Generic x86_64 System

[![CircleCI](https://circleci.com/gh/letoteteam/kiosk_system_x86_64/tree/master.svg?style=svg)](https://circleci.com/gh/letoteteam/kiosk_system_x86_64/tree/master)
[![Hex version](https://img.shields.io/hexpm/v/kiosk_system_x86_64.svg "Hex version")](https://hex.pm/packages/kiosk_system_x86_64)

This is the base Nerves System configuration for a kiosk x86_64 system.

| Feature              | Description                     |
| -------------------- | ------------------------------- |
| CPU                  | Intel                           |
| Memory               | 512 MB+ DRAM                    |
| Storage              | Hard disk/SSD/etc. (/dev/sda)   |
| Linux kernel         | 4.18.9                          |
| IEx terminal         | tty1                            |
| Hardware I/O         | None                            |
| Ethernet             | Yes                             |

## Using

The most common way of using this Nerves System is create a project with `mix
nerves.new` and to export `MIX_TARGET=x86_64`.

Then, change the x86_64 system dependency to
`{:kiosk_system_x86_64, "~> 1.0"}`

See the [Getting started
guide](https://hexdocs.pm/nerves/getting-started.html#creating-a-new-nerves-app)
for more information.

If you need custom modifications to this system for your device, clone this
repository and update as described in [Making custom
systems](https://hexdocs.pm/nerves/systems.html#customizing-your-own-nerves-system)

See the [example project](https://github.com/LeToteTeam/kiosk_system_x86_64/tree/master/example) for more info

## Root disk naming

If you have multiple SSDs, or other devices connected, it's
possible that Linux will enumerate those devices in a nondeterministic order.
This can be mitigated by using `udev` to populate the `/dev/disks/by-*`
directories, but even this can be inconvenient when you just want to refer to
the drive that provides the root filesystem. To address this, `erlinit` creates
`/dev/rootdisk0`, `/dev/rootdisk0p1`, etc. and symlinks them to the expected
devices. For example, if your root file system is on `/dev/mmcblk0p1`, you'll
get a symlink from `/dev/rootdisk0p1` to `/dev/mmcblk0p1` and the whole disk
will be `/dev/rootdisk0`. Similarly, if the root filesystem is on `/dev/sdb1`,
you'd still get `/dev/rootdisk0p1` and `/dev/rootdisk0` and they'd by symlinked
to `/dev/sdb1` and `/dev/sdb` respectively.
