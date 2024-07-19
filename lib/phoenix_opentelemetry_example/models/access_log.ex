defmodule PhoenixOpentelemetryExample.Models.AccessLog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "access_logs" do
    field :ip_address, :string
    field :path, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(access_log, attrs) do
    access_log
    |> cast(attrs, [:ip_address, :path])
    |> validate_required([:ip_address, :path])
  end
end
