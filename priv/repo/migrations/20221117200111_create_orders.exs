defmodule Store.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :customer_id,
          references(:customers, on_delete: :nilify_all, on_update: :nilify_all, type: :binary_id)

      add :order_products_id,
          references(:order_products,
            on_delete: :nilify_all,
            on_update: :nilify_all,
            type: :binary_id
          )

      timestamps()
    end

    create index(:orders, [:customer_id])
    create index(:orders, [:order_products_id])
  end
end
