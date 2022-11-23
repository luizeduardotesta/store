defmodule StoreGraphql.Schema.Types do
  use Absinthe.Schema.Notation
  alias StoreGraphql.Schema.Types
  import_types(Types.CustomerType)
  import_types(Types.ProductType)
end
