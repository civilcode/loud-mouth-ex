defmodule LoudMouthPlatform.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      aliases: aliases,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      # Coverage report tool for Elixir with coveralls.io integration
      {:excoveralls, "~> 0.5", only: :test},
      # A static code analysis tool for the Elixir language with a focus on code consistency and teaching
      {:credo, "~> 0.4", only: [:dev, :test]},
      # Automatically run your Elixir project's tests each time you save a file
      {:mix_test_watch, "~> 0.2", only: :dev},
    ]
  end

  defp aliases do
     [
       "project.check": ["coveralls --umbrella", "credo"],
       "ecto.setup": ["ecto.create", "ecto.migrate", "ecto.seed"],
       "ecto.seed": ["run apps/loud_mouth/priv/repo/seeds.exs"],
       "ecto.reset": ["ecto.drop", "ecto.setup"],
       "test": ["ecto.create --quiet", "ecto.migrate", "test"]
     ]
   end
end
