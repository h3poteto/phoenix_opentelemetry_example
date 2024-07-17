import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_opentelemetry_example, PhoenixOpentelemetryExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MuVmgUt4Gypj3l+dx76x1sTJhRWKahhS9KipVC5Qd55erCEeib4yb+c18qm2c3jI",
  server: false

# In test we don't send emails.
config :phoenix_opentelemetry_example, PhoenixOpentelemetryExample.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true
