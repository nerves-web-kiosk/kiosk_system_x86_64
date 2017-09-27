if Mix.env == :test do
  hash = :os.cmd('git rev-parse HEAD')
    |> to_string
    |> String.trim
  System.put_env("NERVES_FW_VCS_IDENTIFIER", hash)
end

defmodule KioskSystemx8664.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :kiosk_system_x86_64,
     version: @version,
     elixir: "~> 1.4",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "nerves.precompile", "deps.precompile"],
     "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]]]
  end

  def application do
    []
  end

  defp deps do
    [
      {:nerves, "~> 0.7", runtime: false},
      {:nerves_system_br, "~> 0.13.7", runtime: false},
      {:nerves_toolchain_x86_64_unknown_linux_gnu, "~> 0.11.0", runtime: false}
    ]
  end

  defp description do
    """
    Nerves System - x86_64 Kiosk
    """
  end

  defp package do
   [maintainers: ["Justin Schneck", "Greg Mefford", "Jeff Smith"],
    files: ["LICENSE", "mix.exs", "nerves_defconfig", "nerves.exs", "README.md", "VERSION",
            "rootfs_overlay", "fwup.conf", "grub.cfg", "linux-4.9.defconfig", "config.txt", "post-createfs.sh", "post-build.sh"],
    licenses: ["Apache 2.0"],
    links: %{"Github" => "https://github.com/letoteteam/kiosk_system_x86_64"}]
  end

end
