# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :falling_back,
  ecto_repos: [FallingBack.Repo]

# Configures the endpoint
config :falling_back, FallingBackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "16m9Ve42Gv/6h2Ch5BYyXET+XyaC7tFm5OUKGB49DtwlcsesmdsLLAkfQ8y0tUB/",
  render_errors: [view: FallingBackWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FallingBack.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
