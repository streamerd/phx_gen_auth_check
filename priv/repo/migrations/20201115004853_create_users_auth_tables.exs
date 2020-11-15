defmodule PhxGenAuthCheck.Repo.Migrations.CreateUsersAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:users) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps()

      # (+) phx.gen.auth Accounts User ..
      add :username, :string
      add :city, :string
      add :country, :string

      add :roles, {:array, :string}, default: ["user"]
      add :behaviours, {:array, :string}, default: ["audience"]
      # add :external_logins, {:array, :map}, default: []
      # (+) phx.gen.auth Accounts User ..
    end

    create index(:users, [:behaviours, :city, :country])

    # phx.gen.auth + (:username)
    create unique_index(:users, [:email, :username])

    create table(:users_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:users_tokens, [:user_id])
    create unique_index(:users_tokens, [:context, :token])
  end
end
