defmodule TestStreamBulkInsert.BugsTest do
  use TestStreamBulkInsert.DataCase

  alias TestStreamBulkInsert.Bugs

  describe "asdf" do
    alias TestStreamBulkInsert.Bugs.StreamBulkInsert

    import TestStreamBulkInsert.BugsFixtures

    @invalid_attrs %{}

    test "list_asdf/0 returns all asdf" do
      stream_bulk_insert = stream_bulk_insert_fixture()
      assert Bugs.list_asdf() == [stream_bulk_insert]
    end

    test "get_stream_bulk_insert!/1 returns the stream_bulk_insert with given id" do
      stream_bulk_insert = stream_bulk_insert_fixture()
      assert Bugs.get_stream_bulk_insert!(stream_bulk_insert.id) == stream_bulk_insert
    end

    test "create_stream_bulk_insert/1 with valid data creates a stream_bulk_insert" do
      valid_attrs = %{}

      assert {:ok, %StreamBulkInsert{} = stream_bulk_insert} = Bugs.create_stream_bulk_insert(valid_attrs)
    end

    test "create_stream_bulk_insert/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bugs.create_stream_bulk_insert(@invalid_attrs)
    end

    test "update_stream_bulk_insert/2 with valid data updates the stream_bulk_insert" do
      stream_bulk_insert = stream_bulk_insert_fixture()
      update_attrs = %{}

      assert {:ok, %StreamBulkInsert{} = stream_bulk_insert} = Bugs.update_stream_bulk_insert(stream_bulk_insert, update_attrs)
    end

    test "update_stream_bulk_insert/2 with invalid data returns error changeset" do
      stream_bulk_insert = stream_bulk_insert_fixture()
      assert {:error, %Ecto.Changeset{}} = Bugs.update_stream_bulk_insert(stream_bulk_insert, @invalid_attrs)
      assert stream_bulk_insert == Bugs.get_stream_bulk_insert!(stream_bulk_insert.id)
    end

    test "delete_stream_bulk_insert/1 deletes the stream_bulk_insert" do
      stream_bulk_insert = stream_bulk_insert_fixture()
      assert {:ok, %StreamBulkInsert{}} = Bugs.delete_stream_bulk_insert(stream_bulk_insert)
      assert_raise Ecto.NoResultsError, fn -> Bugs.get_stream_bulk_insert!(stream_bulk_insert.id) end
    end

    test "change_stream_bulk_insert/1 returns a stream_bulk_insert changeset" do
      stream_bulk_insert = stream_bulk_insert_fixture()
      assert %Ecto.Changeset{} = Bugs.change_stream_bulk_insert(stream_bulk_insert)
    end
  end
end
