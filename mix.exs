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
  
  provider = 
    if System.get_env("CI") != nil do
      Nerves.Artifact.Providers.Local
    else
      Nerves.Artifact.Providers.Docker
    end

  @provider provider

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
      aliases: ["loadconfig": [&bootstrap/1]]
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
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
      provider: @provider,
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 0.10", runtime: false},
      {:nerves_system_br, "~> 0.17.0", runtime: false, app: false},
      {:nerves_toolchain_x86_64_unknown_linux_gnu , "~> 0.13.1", runtime: false},
      {:nerves_system_linter, "~> 0.3.0", runtime: false}
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
      "fwup-revert.conf",
      "grub.cfg",
      "linux-4.13.defconfig",
      "post-createfs.sh",
      "post-build.sh",
      "Config.in",
      "external.mk",
      "package",
      "users_table.txt",
      "priv",
      "patches"
    ]
  end
end
