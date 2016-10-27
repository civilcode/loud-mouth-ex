defmodule LoudMouthAPI.Mixfile do
  use Mix.Project

  def project do
    [app: :loud_mouth_api,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {LoudMouthAPI, []},
      applications: [
        :phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext, :ecto, :postgrex
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # Standard Phoenix packages
      {:phoenix, "~> 1.2.1"},
      {:phoenix_pubsub, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      # PostgreSQL driver for Elixir
      {:postgrex, ">= 0.0.0"},
      # A database wrapper and language integrated query for Elixir
      {:ecto, "~> 2.0.0"},
      # Composable assertions for JSON API payload
      {:json_api_assert, "~> 0.0.2", only: :test},
      # LoudMouth Domain
      {:loud_mouth, in_umbrella: true},
      # A serialization library implementing the jsonapi.org spec
      {:ja_serializer, "~> 0.11.1"},
    ]
  end
end
