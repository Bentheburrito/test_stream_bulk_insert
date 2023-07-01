defmodule TestStreamBulkInsert.Bugs.StreamBulkInsert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "asdf" do


    timestamps()
  end

  @doc false
  def changeset(stream_bulk_insert, attrs) do
    stream_bulk_insert
    |> cast(attrs, [])
    |> validate_required([])
  end
end
