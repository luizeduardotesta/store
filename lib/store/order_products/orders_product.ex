defmodule Store.OrderProducts.OrdersProduct do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "order_products" do
    field :price, :decimal
    field :quantity, :integer

    belongs_to :product, Store.Products.Product
    belongs_to :order, Store.Orders.Order

    timestamps()
  end

  @doc false
  def changeset(orders_product, attrs) do
    orders_product
    |> cast(attrs, [:price, :quantity, :product_id])
    |> validate_required([:price, :quantity, :product_id])
  end
end
