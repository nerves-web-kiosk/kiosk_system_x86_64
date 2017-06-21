defmodule KioskSystemx8664.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :kiosk_system_x86_64,
     version: @version,
     elixir: "~> 1.3",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]]
  end

  def application do
    []
  end

  defp deps do
    [{:nerves, "~> 0.5"},
     {:nerves_system_br, "~> 0.12.0"},
     {:nerves_toolchain_x86_64_unknown_linux_gnu, "~> 0.10.0"}]
  end

  defp description do
    """
    Nerves System - x86_64 Kiosk
    """
  end

end
