use Mix.Config

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :loud_mouth, LoudMouth.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "loud_mouth_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
