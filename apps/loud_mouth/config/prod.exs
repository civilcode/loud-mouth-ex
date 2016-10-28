use Mix.Config

# Do not print debug messages in production
config :logger, level: :info

config :loud_mouth, LoudMouth.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
