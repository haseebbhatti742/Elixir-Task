defmodule ElixirTask.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :dropoffAddress, :string
      add :pickupAddress, :string
      add :weight, :float
      add :date, :date

      timestamps()
    end

  end
end
