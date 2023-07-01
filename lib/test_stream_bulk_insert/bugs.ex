defmodule TestStreamBulkInsert.Bugs do
  @moduledoc """
  The Bugs context.
  """

  import Ecto.Query, warn: false
  alias TestStreamBulkInsert.Repo

  alias TestStreamBulkInsert.Bugs.StreamBulkInsert

  @doc """
  Returns the list of asdf.

  ## Examples

      iex> list_asdf()
      [%StreamBulkInsert{}, ...]

  """
  def list_asdf do
    Repo.all(StreamBulkInsert)
  end

  @doc """
  Gets a single stream_bulk_insert.

  Raises `Ecto.NoResultsError` if the Stream bulk insert does not exist.

  ## Examples

      iex> get_stream_bulk_insert!(123)
      %StreamBulkInsert{}

      iex> get_stream_bulk_insert!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stream_bulk_insert!(id), do: Repo.get!(StreamBulkInsert, id)

  @doc """
  Creates a stream_bulk_insert.

  ## Examples

      iex> create_stream_bulk_insert(%{field: value})
      {:ok, %StreamBulkInsert{}}

      iex> create_stream_bulk_insert(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stream_bulk_insert(attrs \\ %{}) do
    %StreamBulkInsert{}
    |> StreamBulkInsert.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stream_bulk_insert.

  ## Examples

      iex> update_stream_bulk_insert(stream_bulk_insert, %{field: new_value})
      {:ok, %StreamBulkInsert{}}

      iex> update_stream_bulk_insert(stream_bulk_insert, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stream_bulk_insert(%StreamBulkInsert{} = stream_bulk_insert, attrs) do
    stream_bulk_insert
    |> StreamBulkInsert.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stream_bulk_insert.

  ## Examples

      iex> delete_stream_bulk_insert(stream_bulk_insert)
      {:ok, %StreamBulkInsert{}}

      iex> delete_stream_bulk_insert(stream_bulk_insert)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stream_bulk_insert(%StreamBulkInsert{} = stream_bulk_insert) do
    Repo.delete(stream_bulk_insert)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stream_bulk_insert changes.

  ## Examples

      iex> change_stream_bulk_insert(stream_bulk_insert)
      %Ecto.Changeset{data: %StreamBulkInsert{}}

  """
  def change_stream_bulk_insert(%StreamBulkInsert{} = stream_bulk_insert, attrs \\ %{}) do
    StreamBulkInsert.changeset(stream_bulk_insert, attrs)
  end
end
