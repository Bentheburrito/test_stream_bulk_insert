defmodule TestStreamBulkInsert.Repo do
  use Ecto.Repo,
    otp_app: :test_stream_bulk_insert,
    adapter: Ecto.Adapters.Postgres
end
