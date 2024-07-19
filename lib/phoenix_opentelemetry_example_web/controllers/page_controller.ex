defmodule PhoenixOpentelemetryExampleWeb.PageController do
  use PhoenixOpentelemetryExampleWeb, :controller
  alias PhoenixOpentelemetryExample.Models.AccessLog
  alias PhoenixOpentelemetryExample.Repo
  alias PhoenixOpentelemetryExample.HTTPClient

  def home(conn, _params) do
    Repo.insert(%AccessLog{
      ip_address: conn.remote_ip |> :inet.ntoa() |> to_string(),
      path: conn.request_path |> to_string()
    })

    PhoenixOpentelemetryExample.Jobs.AccessCheck.new(%{
      "ip" => conn.remote_ip |> :inet.ntoa() |> to_string()
    })
    |> OpentelemetryOban.insert()

    HTTPClient.search("/?search=tesla")

    render(conn, :home, layout: false)
  end
end
