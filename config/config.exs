# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :phoenix_opentelemetry_example,
  ecto_repos: [PhoenixOpentelemetryExample.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :phoenix_opentelemetry_example, PhoenixOpentelemetryExampleWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [
      html: PhoenixOpentelemetryExampleWeb.ErrorHTML,
      json: PhoenixOpentelemetryExampleWeb.ErrorJSON
    ],
    layout: false
  ],
  pubsub_server: PhoenixOpentelemetryExample.PubSub,
  live_view: [signing_salt: "6jeO8nAA"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :phoenix_opentelemetry_example, PhoenixOpentelemetryExample.Mailer,
  adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :opentelemetry, :processors,
  otel_batch_processor: %{
    exporter: {:opentelemetry_exporter, %{}}
  }

config :opentelemetry_exporter,
  otlp_protocol: :http_protobuf,
  otlp_compression: :gzip,
  otlp_endpoint: "http://localhost:4318"

config :phoenix_opentelemetry_example, Oban,
  engine: Oban.Engines.Basic,
  queues: [default: 10],
  repo: PhoenixOpentelemetryExample.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
