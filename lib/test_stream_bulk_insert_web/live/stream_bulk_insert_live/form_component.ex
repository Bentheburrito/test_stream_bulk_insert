defmodule TestStreamBulkInsertWeb.StreamBulkInsertLive.FormComponent do
  use TestStreamBulkInsertWeb, :live_component

  alias TestStreamBulkInsert.Bugs

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage stream_bulk_insert records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="stream_bulk_insert-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

        <:actions>
          <.button phx-disable-with="Saving...">Save Stream bulk insert</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{stream_bulk_insert: stream_bulk_insert} = assigns, socket) do
    changeset = Bugs.change_stream_bulk_insert(stream_bulk_insert)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"stream_bulk_insert" => stream_bulk_insert_params}, socket) do
    changeset =
      socket.assigns.stream_bulk_insert
      |> Bugs.change_stream_bulk_insert(stream_bulk_insert_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"stream_bulk_insert" => stream_bulk_insert_params}, socket) do
    save_stream_bulk_insert(socket, socket.assigns.action, stream_bulk_insert_params)
  end

  defp save_stream_bulk_insert(socket, :edit, stream_bulk_insert_params) do
    case Bugs.update_stream_bulk_insert(socket.assigns.stream_bulk_insert, stream_bulk_insert_params) do
      {:ok, stream_bulk_insert} ->
        notify_parent({:saved, stream_bulk_insert})

        {:noreply,
         socket
         |> put_flash(:info, "Stream bulk insert updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_stream_bulk_insert(socket, :new, stream_bulk_insert_params) do
    case Bugs.create_stream_bulk_insert(stream_bulk_insert_params) do
      {:ok, stream_bulk_insert} ->
        notify_parent({:saved, stream_bulk_insert})

        {:noreply,
         socket
         |> put_flash(:info, "Stream bulk insert created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
