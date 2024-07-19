defmodule PhoenixOpentelemetryExampleWeb.PageController do
  use PhoenixOpentelemetryExampleWeb, :controller
  alias PhoenixOpentelemetryExample.Models.AccessLog
  alias PhoenixOpentelemetryExample.Repo

  def home(conn, _params) do
    Repo.insert(%AccessLog{
      ip_address: conn.remote_ip |> :inet.ntoa() |> to_string(),
      path: conn.request_path |> to_string()
    })

    render(conn, :home, layout: false)
  end
end
