# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fallout_4_tracker,
  ecto_repos: [Fallout_4Tracker.Repo]

# Configures the endpoint
config :fallout_4_tracker, Fallout_4Tracker.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/oKm+k1eqCm5Ud4QnTdBV2TlAsovekuWZ9ZkWZ93oIURIDZY0DKlHv+s+M7Jy2FZ",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: Fallout_4Tracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
