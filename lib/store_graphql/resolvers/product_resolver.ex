defmodule StoreGraphql.Resolvers.ProductResolver do
  alias Store.Products

  def list_products(_parentes, _args, _resolution) do
    {:ok, Products.list_products()}
  end
end
