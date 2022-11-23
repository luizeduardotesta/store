defmodule StoreGraphql.Schema.Types.ProductType do
  use Absinthe.Schema.Notation

  object :product_type do
    field :id, :string
    field :name, :string
    field :price, :string
    field :quantity, :integer
  end
end
