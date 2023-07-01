defmodule TestStreamBulkInsert.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestStreamBulkInsertWeb.Telemetry,
      # Start the Ecto repository
      # TestStreamBulkInsert.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestStreamBulkInsert.PubSub},
      # Start Finch
      {Finch, name: TestStreamBulkInsert.Finch},
      # Start the Endpoint (http/https)
      TestStreamBulkInsertWeb.Endpoint
      # Start a worker by calling: TestStreamBulkInsert.Worker.start_link(arg)
      # {TestStreamBulkInsert.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestStreamBulkInsert.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestStreamBulkInsertWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
