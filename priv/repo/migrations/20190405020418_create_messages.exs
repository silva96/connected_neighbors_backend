defmodule ConnectedNeighbors.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :text
      add :user_id, references(:users), null: false

      timestamps()
    end
  end
end
