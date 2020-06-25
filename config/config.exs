# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :smoke,
  ecto_repos: [Smoke.Repo]

config :smoke_web,
  ecto_repos: [Smoke.Repo],
  generators: [context_app: :smoke]

# Configures the endpoint
config :smoke_web, SmokeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m7aEvM9m+0OsW3k2DRG1l4WyKngxDxzgxpd5yk2vdS8oaSL4M0/c2prKM6WYDb+4",
  render_errors: [view: SmokeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Smoke.PubSub,
  live_view: [signing_salt: "jnAGl8LP"]

# Pow Auth Config
config :smoke, :pow,
  user: Smoke.Users.User,
  repo: Smoke.Repo

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
