defmodule LoudMouth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :loud_mouth,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      aliases: aliases,
      elixirc_paths: elixirc_paths(Mix.env),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ecto, :postgrex, :scrivener_ecto],
     mod: {LoudMouth, []}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # PostgreSQL driver for Elixir
      {:postgrex, ">= 0.0.0"},
      # A database wrapper and language integrated query for Elixir
      {:ecto, "~> 2.0.0"},
      # ExMachina makes it easy to create test data and associations
      {:ex_machina, "~> 1.0", only: :test},
      # Faker is a pure Elixir library for generating fake data
      {:faker, "~> 0.7.0", only: :test},
      # ValidField allows you to unit test changesets
      {:valid_field, github: "DockYard/valid_field", only: :test},
      # Paginate your Ecto queries
      {:scrivener_ecto, github: "drewolson/scrivener_ecto"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "ecto.seed"],
      "ecto.seed": ["run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
