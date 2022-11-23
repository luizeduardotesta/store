defmodule Store.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields ~w(email first_name last_name password password_confirmation role)a
  @optional_fields ~w(password_hash)a
  schema "customers" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string
    field :password_hash, :string
    field :role, :string, default: "user"

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields ++ @optional_fields)
    |> unique_constraint(:email, message: "Esse e-mail já existe")
    |> update_change(:email, &String.downcase/1)
    |> validate_format(:email, ~r/@/, message: "Digite um e-mail valido")
    |> validate_length(:password, min: 6, max: 12, message: "O password invalido, minimo 6 chars")
    |> validate_confirmation(:password, message: "password não é igual")
    |> hashing()
  end

  defp hashing(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hashing(changeset), do: changeset
end
