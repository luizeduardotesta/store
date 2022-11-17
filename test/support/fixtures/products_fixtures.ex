defmodule Store.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Store.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: "120.5",
        quantity: 42
      })
      |> Store.Products.create_product()

    product
  end
end
