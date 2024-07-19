defmodule PhoenixOpentelemetryExample.Jobs.AggregateAccess do
  use Oban.Worker, queue: :default
  alias PhoenixOpentelemetryExample.Models.AccessLog
  alias PhoenixOpentelemetryExample.Repo
  import Ecto.Query

  @impl Oban.Worker
  def perform(_) do
    query =
      from a in AccessLog,
        group_by: a.ip_address,
        select: %{ip_address: a.ip_address, count: count(a.id)}

    res = Repo.all(query)
    IO.inspect(res)
    :ok
  end
end
