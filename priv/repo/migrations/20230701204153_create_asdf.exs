defmodule TestStreamBulkInsert.Repo.Migrations.CreateAsdf do
  use Ecto.Migration

  def change do
    create table(:asdf) do

      timestamps()
    end
  end
end
