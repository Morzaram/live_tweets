defmodule LiveTweets.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :string
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :retweet_id, references(:tweets, on_delete: :nothing, type: :binary_id)
      add :liked_tweet_id, references(:tweets, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:tweets, [:user_id])
    create index(:tweets, [:retweet_id])
    create index(:tweets, [:liked_tweet_id])
  end
end
