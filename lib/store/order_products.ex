defmodule Store.OrderProducts do
  @moduledoc """
  The OrderProducts context.
  """

  import Ecto.Query, warn: false
  alias Store.Repo

  alias Store.OrderProducts.OrdersProduct

  @doc """
  Returns the list of order_products.

  ## Examples

      iex> list_order_products()
      [%OrdersProduct{}, ...]

  """
  def list_order_products do
    Repo.all(OrdersProduct)
  end

  @doc """
  Gets a single orders_product.

  Raises `Ecto.NoResultsError` if the Orders product does not exist.

  ## Examples

      iex> get_orders_product!(123)
      %OrdersProduct{}

      iex> get_orders_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_orders_product!(id), do: Repo.get!(OrdersProduct, id)

  @doc """
  Creates a orders_product.

  ## Examples

      iex> create_orders_product(%{field: value})
      {:ok, %OrdersProduct{}}

      iex> create_orders_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_orders_product(attrs \\ %{}) do
    %OrdersProduct{}
    |> OrdersProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a orders_product.

  ## Examples

      iex> update_orders_product(orders_product, %{field: new_value})
      {:ok, %OrdersProduct{}}

      iex> update_orders_product(orders_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_orders_product(%OrdersProduct{} = orders_product, attrs) do
    orders_product
    |> OrdersProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a orders_product.

  ## Examples

      iex> delete_orders_product(orders_product)
      {:ok, %OrdersProduct{}}

      iex> delete_orders_product(orders_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_orders_product(%OrdersProduct{} = orders_product) do
    Repo.delete(orders_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking orders_product changes.

  ## Examples

      iex> change_orders_product(orders_product)
      %Ecto.Changeset{data: %OrdersProduct{}}

  """
  def change_orders_product(%OrdersProduct{} = orders_product, attrs \\ %{}) do
    OrdersProduct.changeset(orders_product, attrs)
  end
end
