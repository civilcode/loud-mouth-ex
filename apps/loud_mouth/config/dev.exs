use Mix.Config

config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :loud_mouth, LoudMouth.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "loud_mouth_dev",
  hostname: "localhost",  
  pool_size: 20
