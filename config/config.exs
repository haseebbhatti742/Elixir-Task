# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_task,
  ecto_repos: [ElixirTask.Repo]

# Configures the endpoint
config :elixir_task, ElixirTaskWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xzfEYDaWFeM9u8HFe9nuXRtLfgJtPxvNXbyrgwHxV/E9kSU9wqnrnaqL84EIsOfV",
  render_errors: [view: ElixirTaskWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirTask.PubSub,
  live_view: [signing_salt: "UYMzbtey"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
