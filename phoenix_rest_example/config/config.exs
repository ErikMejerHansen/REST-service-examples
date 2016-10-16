# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_rest_example,
  ecto_repos: [PhoenixRestExample.Repo]

# Configures the endpoint
config :phoenix_rest_example, PhoenixRestExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/QViWcZyYNiICdrfHxBLiueFgXXjdS1TkL8RtAOcu/sze9IZqM+DMZUJ6O8D4SVL",
  render_errors: [view: PhoenixRestExample.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixRestExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id], level: :warn

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
