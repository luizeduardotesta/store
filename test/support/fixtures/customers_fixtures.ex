defmodule Store.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Store.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        last_name: "some last_name",
        email: "some email",
        first_name: "some first_name",
        password_hash: "some password_hash",
        role: "some role"
      })
      |> Store.Customers.create_customer()

    customer
  end
end
