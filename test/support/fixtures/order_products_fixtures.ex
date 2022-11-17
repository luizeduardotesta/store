defmodule Store.OrderProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Store.OrderProducts` context.
  """

  @doc """
  Generate a orders_product.
  """
  def orders_product_fixture(attrs \\ %{}) do
    {:ok, orders_product} =
      attrs
      |> Enum.into(%{
        price: "120.5",
        quantity: 42
      })
      |> Store.OrderProducts.create_orders_product()

    orders_product
  end
end
