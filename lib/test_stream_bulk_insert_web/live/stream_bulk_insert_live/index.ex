defmodule TestStreamBulkInsertWeb.StreamBulkInsertLive.Index do
  use TestStreamBulkInsertWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      if connected?(socket) do
        stream_configure(socket, :mystream, dom_id: &custom_dom_id/1)
      else
        socket
      end

    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    IO.inspect(socket.assigns[:streams][:__configured__], label: "__configured__")

    tuple_list = [{1234, 2345}, {4321, 5432}]
    # send(self(), {:workaround, tuple_list})

    {
      :noreply,
      socket
      |> stream(:mystream, tuple_list)
    }
  end

  @impl true
  def handle_info({:workaround, tuple_list}, socket) do
    {:noreply, stream(socket, :mystream, tuple_list)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div :if={assigns[:streams][:mystream]} id="session-list" phx-update="stream">
      <div :for={{dom_id, {one, two}} <- @streams.mystream} id={dom_id}>
        1: <%= one %>, 2: <%= two %>
      </div>
    </div>
    """
  end

  defp custom_dom_id({one, two}) do
    "session-#{one}-#{two}"
  end
end
