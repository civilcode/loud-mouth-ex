# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :loud_mouth_api,
  namespace: LoudMouthAPI

# Configures the endpoint
config :loud_mouth_api, LoudMouthAPI.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZYqReS0V+i0dtzc4JnJxKXluZj5FRJnkz7e1a/REX99HUZ4Yljmk8F2U4Bc2EIim",
  render_errors: [view: LoudMouthAPI.ErrorView, accepts: ~w(json)],
  pubsub: [name: LoudMouthAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :loud_mouth_api, ecto_repos: []

config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
