defmodule Store.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Store.OrderProducts.OrdersProduct

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    belongs_to :customer, Store.Customers.Customer
    has_many :order_products, OrdersProduct

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id])
    |> foreign_key_constraint(:customer_id)
    |> cast_assoc(:order_products, with: &OrdersProduct.changeset/2)
    |> validate_required([:customer_id, :order_products])
  end
end
