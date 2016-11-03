defmodule LoudMouthGraphQL.Mixfile do
  use Mix.Project

  def project do
    [app: :loud_mouth_graphql,
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
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {LoudMouthGraphQL, []},
      applications: [
       :phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext, :absinthe_plug, :loud_mouth
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
      {:phoenix, "~> 1.2.1"},
      {:phoenix_pubsub, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      # Domain
      {:loud_mouth, in_umbrella: true},
      # Plug support for Absinthe, GraphQL for Elixir
      {:absinthe_plug, "~> 1.2.0-alpha0"},
      # Automatically run your Elixir project's tests each time you save a file
      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end
end
