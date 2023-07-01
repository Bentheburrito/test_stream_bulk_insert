defmodule TestStreamBulkInsertWeb.StreamBulkInsertLive.Show do
  use TestStreamBulkInsertWeb, :live_view

  alias TestStreamBulkInsert.Bugs

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:stream_bulk_insert, Bugs.get_stream_bulk_insert!(id))}
  end

  defp page_title(:show), do: "Show Stream bulk insert"
  defp page_title(:edit), do: "Edit Stream bulk insert"
end
