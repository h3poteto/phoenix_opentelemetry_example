defmodule PhoenixOpentelemetryExample.Jobs.AccessCheck do
  use Oban.Worker, queue: :default
  alias PhoenixOpentelemetryExample.Models.AccessLog
  alias PhoenixOpentelemetryExample.Repo
  import Ecto.Query

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"ip" => ip} = _args}) do
    IO.inspect("Access check for IP: #{ip}")
    query = from(AccessLog, where: [ip_address: ^ip])
    Repo.all(query) |> Enum.count() |> IO.inspect()
    :ok
  end
end
