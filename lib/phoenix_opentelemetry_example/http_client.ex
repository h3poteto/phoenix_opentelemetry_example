defmodule PhoenixOpentelemetryExample.HTTPClient do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://www.google.com"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.OpenTelemetry
  plug Tesla.Middleware.PathParams

  def search(path) do
    get(path)
  end
end
