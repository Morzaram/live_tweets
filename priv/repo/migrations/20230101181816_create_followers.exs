defmodule LiveTweets.Repo.Migrations.CreateFollowers do
  use Ecto.Migration

  def change do
    create table(:followers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :follower_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :following_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:followers, [:follower_id])
    create index(:followers, [:following_id])
    create index(:followers, [:follower_id, :following_id], unique: true)
  end
end
