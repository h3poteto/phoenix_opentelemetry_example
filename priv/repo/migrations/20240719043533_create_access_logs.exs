defmodule PhoenixOpentelemetryExample.Repo.Migrations.CreateAccessLogs do
  use Ecto.Migration

  def change do
    create table(:access_logs) do
      add :ip_address, :string
      add :path, :string

      timestamps(type: :utc_datetime)
    end
  end
end
