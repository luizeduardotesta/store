defmodule Store.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :name, :string
    field :price, :decimal
    field :quantity, :integer

    has_many :orders_products, Store.OrderProducts.OrdersProduct

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :quantity])
    |> validate_required([:name, :price, :quantity])
    |> unique_constraint(:name, message: "Esse nome já existe")
  end
end
