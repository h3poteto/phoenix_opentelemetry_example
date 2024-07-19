defmodule PhoenixOpentelemetryExample.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_opentelemetry_example,
    adapter: Ecto.Adapters.Postgres
end
