use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.strip

pkg = :kiosk_system_x86_64

config pkg, :nerves_env,
  type:  :system,
  version: version,
  compiler: :nerves_package,
  platform: Nerves.System.BR,
  platform_config: [
    defconfig: "nerves_defconfig"
  ],
  checksum: [
    "nerves_defconfig",
    "rootfs-additions",
    "linux-4.9.defconfig",
    "fwup.conf",
    "post-build.sh",
    "post-createfs.sh",
    "VERSION"
  ]
