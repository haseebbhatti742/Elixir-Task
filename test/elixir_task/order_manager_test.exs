defmodule ElixirTask.OrderManagerTest do
  use ElixirTask.DataCase

  alias ElixirTask.OrderManager

  describe "orders" do
    alias ElixirTask.OrderManager.Order

    @valid_attrs %{date: ~D[2010-04-17], dropoffAddress: "some dropoffAddress", pickupAddress: "some pickupAddress", weight: 120.5}
    @update_attrs %{date: ~D[2011-05-18], dropoffAddress: "some updated dropoffAddress", pickupAddress: "some updated pickupAddress", weight: 456.7}
    @invalid_attrs %{date: nil, dropoffAddress: nil, pickupAddress: nil, weight: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrderManager.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert OrderManager.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert OrderManager.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = OrderManager.create_order(@valid_attrs)
      assert order.date == ~D[2010-04-17]
      assert order.dropoffAddress == "some dropoffAddress"
      assert order.pickupAddress == "some pickupAddress"
      assert order.weight == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrderManager.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = OrderManager.update_order(order, @update_attrs)
      assert order.date == ~D[2011-05-18]
      assert order.dropoffAddress == "some updated dropoffAddress"
      assert order.pickupAddress == "some updated pickupAddress"
      assert order.weight == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = OrderManager.update_order(order, @invalid_attrs)
      assert order == OrderManager.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = OrderManager.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> OrderManager.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = OrderManager.change_order(order)
    end
  end
end
