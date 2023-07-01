defmodule TestStreamBulkInsert.BugsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestStreamBulkInsert.Bugs` context.
  """

  @doc """
  Generate a stream_bulk_insert.
  """
  def stream_bulk_insert_fixture(attrs \\ %{}) do
    {:ok, stream_bulk_insert} =
      attrs
      |> Enum.into(%{

      })
      |> TestStreamBulkInsert.Bugs.create_stream_bulk_insert()

    stream_bulk_insert
  end
end
