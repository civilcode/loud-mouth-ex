defmodule MasterProxy.Mixfile do
  use Mix.Project

  def project do
    [app: :master_proxy,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug, :loud_mouth_api, :loud_mouth_backoffice],
     mod: {MasterProxy.Application, []}]
  end

  defp deps do
    [{:plug, "~> 1.2"},
     {:cowboy, "~> 1.0"},

     {:loud_mouth_api, in_umbrella: true},
     {:loud_mouth_backoffice, in_umbrella: true}]
  end
end
