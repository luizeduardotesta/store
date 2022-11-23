# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Store.Repo.insert!(%Store.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

customer = %{
  last_name: "1234",
  email: "teste@teste.com",
  first_name: "1234",
  password: "123456",
  password_confirmation: "123456"
}

customer
|> Store.Customers.create_customer()

playstation =
  %{
    name: "playstation"
    price: 3000
    quantity: 300
  }

xbox =
  %{
    name: "xbox"
    price: 2000
    quantity: 100
  }

playstation
|> Store.Products.create_product()

xbox
|> Store.Products.create_product()
