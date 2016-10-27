# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :loud_mouth_backoffice,
  ecto_repos: []

# Configures the endpoint
config :loud_mouth_backoffice, LoudMouthBackoffice.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kFKVoUaKt0/TsSR8lVI9lWuDR+PqObl6vI+55HnhlwbZAPYa7sE1jHIVmf5yJBe8",
  render_errors: [view: LoudMouthBackoffice.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LoudMouthBackoffice.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_admin,
  repo: LoudMouth.Repo,
  module: LoudMouthBackoffice,
  modules: [
    LoudMouthBackoffice.ExAdmin.Dashboard,
    LoudMouthBackoffice.ExAdmin.Person
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
