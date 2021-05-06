defmodule ElixirTask.Repo do
  use Ecto.Repo,
    otp_app: :elixir_task,
    adapter: Ecto.Adapters.Postgres
end
