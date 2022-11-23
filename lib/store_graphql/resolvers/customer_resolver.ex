defmodule StoreGraphql.Resolvers.CustomerResolver do
  alias Store.Customers

  def list_customers(_parentes, _args, _resolution) do
    {:ok, Customers.list_customers()}
  end

  def create_customer(_parentes, %{customer: customer}, _resolution) do
    Customers.create_customer(customer)
  end
end
