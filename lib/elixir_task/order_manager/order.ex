defmodule ElixirTask.OrderManager.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :date, :date
    field :dropoffAddress, :string
    field :pickupAddress, :string
    field :weight, :float

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:dropoffAddress, :pickupAddress, :weight, :date])
    |> validate_required([:dropoffAddress, :pickupAddress, :weight, :date])
  end
end
