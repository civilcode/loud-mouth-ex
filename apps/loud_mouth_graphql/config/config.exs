# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :loud_mouth_graphql, LoudMouthGraphQL.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zmVOMJiDTHZnkc+KojBEntE1oDTEXEprcK/KXsButvm+yv7cT4uAa6aVgSPpHCnI",
  render_errors: [view: LoudMouthGraphQL.ErrorView, accepts: ~w(json)],
  pubsub: [name: LoudMouthGraphQL.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :loud_mouth_graphql, ecto_repos: []

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
