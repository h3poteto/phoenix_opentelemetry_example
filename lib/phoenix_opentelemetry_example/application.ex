defmodule PhoenixOpentelemetryExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    :opentelemetry_cowboy.setup()
    OpentelemetryPhoenix.setup(adapter: :cowboy2)
    OpentelemetryEcto.setup([:phoenix_opentelemetry_example, :repo])

    children = [
      PhoenixOpentelemetryExampleWeb.Telemetry,
      PhoenixOpentelemetryExample.Repo,
      {DNSCluster,
       query: Application.get_env(:phoenix_opentelemetry_example, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixOpentelemetryExample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixOpentelemetryExample.Finch},
      # Start a worker by calling: PhoenixOpentelemetryExample.Worker.start_link(arg)
      # {PhoenixOpentelemetryExample.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixOpentelemetryExampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixOpentelemetryExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixOpentelemetryExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
