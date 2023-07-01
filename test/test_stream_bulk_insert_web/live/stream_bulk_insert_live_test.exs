defmodule TestStreamBulkInsertWeb.StreamBulkInsertLiveTest do
  use TestStreamBulkInsertWeb.ConnCase

  import Phoenix.LiveViewTest
  import TestStreamBulkInsert.BugsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_stream_bulk_insert(_) do
    stream_bulk_insert = stream_bulk_insert_fixture()
    %{stream_bulk_insert: stream_bulk_insert}
  end

  describe "Index" do
    setup [:create_stream_bulk_insert]

    test "lists all asdf", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/asdf")

      assert html =~ "Listing Asdf"
    end

    test "saves new stream_bulk_insert", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/asdf")

      assert index_live |> element("a", "New Stream bulk insert") |> render_click() =~
               "New Stream bulk insert"

      assert_patch(index_live, ~p"/asdf/new")

      assert index_live
             |> form("#stream_bulk_insert-form", stream_bulk_insert: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#stream_bulk_insert-form", stream_bulk_insert: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/asdf")

      html = render(index_live)
      assert html =~ "Stream bulk insert created successfully"
    end

    test "updates stream_bulk_insert in listing", %{conn: conn, stream_bulk_insert: stream_bulk_insert} do
      {:ok, index_live, _html} = live(conn, ~p"/asdf")

      assert index_live |> element("#asdf-#{stream_bulk_insert.id} a", "Edit") |> render_click() =~
               "Edit Stream bulk insert"

      assert_patch(index_live, ~p"/asdf/#{stream_bulk_insert}/edit")

      assert index_live
             |> form("#stream_bulk_insert-form", stream_bulk_insert: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#stream_bulk_insert-form", stream_bulk_insert: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/asdf")

      html = render(index_live)
      assert html =~ "Stream bulk insert updated successfully"
    end

    test "deletes stream_bulk_insert in listing", %{conn: conn, stream_bulk_insert: stream_bulk_insert} do
      {:ok, index_live, _html} = live(conn, ~p"/asdf")

      assert index_live |> element("#asdf-#{stream_bulk_insert.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#asdf-#{stream_bulk_insert.id}")
    end
  end

  describe "Show" do
    setup [:create_stream_bulk_insert]

    test "displays stream_bulk_insert", %{conn: conn, stream_bulk_insert: stream_bulk_insert} do
      {:ok, _show_live, html} = live(conn, ~p"/asdf/#{stream_bulk_insert}")

      assert html =~ "Show Stream bulk insert"
    end

    test "updates stream_bulk_insert within modal", %{conn: conn, stream_bulk_insert: stream_bulk_insert} do
      {:ok, show_live, _html} = live(conn, ~p"/asdf/#{stream_bulk_insert}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Stream bulk insert"

      assert_patch(show_live, ~p"/asdf/#{stream_bulk_insert}/show/edit")

      assert show_live
             |> form("#stream_bulk_insert-form", stream_bulk_insert: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#stream_bulk_insert-form", stream_bulk_insert: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/asdf/#{stream_bulk_insert}")

      html = render(show_live)
      assert html =~ "Stream bulk insert updated successfully"
    end
  end
end
