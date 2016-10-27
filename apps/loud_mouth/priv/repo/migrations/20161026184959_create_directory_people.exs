defmodule LoudMouth.Repo.Migrations.CreateDirectoryPeople do
  use Ecto.Migration

  def change do
    create table(:directory_people, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string, null: false
      add :given_name, :string
      add :family_name, :string

      timestamps
    end

    create unique_index(:directory_people, [:email])
  end
end
