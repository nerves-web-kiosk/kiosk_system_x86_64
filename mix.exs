if Mix.env == :test do
  hash = :os.cmd('git rev-parse HEAD')
    |> to_string
    |> String.trim
  System.put_env("NERVES_FW_VCS_IDENTIFIER", hash)
end

defmodule KioskSystemx8664.Mixfile do
  use Mix.Project

  @app :kiosk_system_x86_64
  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.trim

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.4",
      compilers: Mix.compilers ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: ["deps.precompile": ["nerves.env", "nerves.precompile", "deps.precompile"],
      "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]]
    ]
  end

  def application do
    []
  end

  defp nerves_package do
    [
      type: :system,
      artifact_sites: [
        {:github_releases, "letoteteam/#{@app}"}
      ],
      provider: Nerves.Artifact.Providers.Docker,
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, github: "nerves-project/nerves", branch: "rel-v0.9.0", runtime: false, override: true},
      {:nerves_system_br, "~> 0.16.1-2017-11", runtime: false, app: false},
      {:nerves_toolchain_x86_64_unknown_linux_gnu , "~> 0.12.1", runtime: false}
    ]
  end

  defp description do
    """
    Nerves System - x86_64 Kiosk
    """
  end

  defp package do
    [
      maintainers: ["Justin Schneck", "Greg Mefford", "Jeff Smith"],
      files: package_files(),
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/letoteteam/#{@app}"}
    ]
  end

  defp package_files do
    [
      "LICENSE",
      "mix.exs",
      "nerves_defconfig",
      "README.md",
      "VERSION",
      "rootfs_overlay",
      "fwup.conf",
      "grub.cfg",
      "linux-4.9.defconfig",
      "config.txt",
      "post-createfs.sh",
      "post-build.sh",
      "Config.in",
      "external.mk",
      "package"
    ]
  end
end
