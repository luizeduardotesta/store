defmodule Store.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "customers" do
    field :Last_name, :string
    field :email, :string
    field :first_name, :string
    field :password_hash, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:email, :first_name, :Last_name, :password_hash, :role])
    |> validate_required([:email, :first_name, :Last_name, :password_hash, :role])
  end
end
