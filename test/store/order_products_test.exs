defmodule Store.OrderProductsTest do
  use Store.DataCase

  alias Store.OrderProducts

  describe "order_products" do
    alias Store.OrderProducts.OrdersProduct

    import Store.OrderProductsFixtures

    @invalid_attrs %{price: nil, quantity: nil}

    test "list_order_products/0 returns all order_products" do
      orders_product = orders_product_fixture()
      assert OrderProducts.list_order_products() == [orders_product]
    end

    test "get_orders_product!/1 returns the orders_product with given id" do
      orders_product = orders_product_fixture()
      assert OrderProducts.get_orders_product!(orders_product.id) == orders_product
    end

    test "create_orders_product/1 with valid data creates a orders_product" do
      valid_attrs = %{price: "120.5", quantity: 42}

      assert {:ok, %OrdersProduct{} = orders_product} = OrderProducts.create_orders_product(valid_attrs)
      assert orders_product.price == Decimal.new("120.5")
      assert orders_product.quantity == 42
    end

    test "create_orders_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrderProducts.create_orders_product(@invalid_attrs)
    end

    test "update_orders_product/2 with valid data updates the orders_product" do
      orders_product = orders_product_fixture()
      update_attrs = %{price: "456.7", quantity: 43}

      assert {:ok, %OrdersProduct{} = orders_product} = OrderProducts.update_orders_product(orders_product, update_attrs)
      assert orders_product.price == Decimal.new("456.7")
      assert orders_product.quantity == 43
    end

    test "update_orders_product/2 with invalid data returns error changeset" do
      orders_product = orders_product_fixture()
      assert {:error, %Ecto.Changeset{}} = OrderProducts.update_orders_product(orders_product, @invalid_attrs)
      assert orders_product == OrderProducts.get_orders_product!(orders_product.id)
    end

    test "delete_orders_product/1 deletes the orders_product" do
      orders_product = orders_product_fixture()
      assert {:ok, %OrdersProduct{}} = OrderProducts.delete_orders_product(orders_product)
      assert_raise Ecto.NoResultsError, fn -> OrderProducts.get_orders_product!(orders_product.id) end
    end

    test "change_orders_product/1 returns a orders_product changeset" do
      orders_product = orders_product_fixture()
      assert %Ecto.Changeset{} = OrderProducts.change_orders_product(orders_product)
    end
  end
end
