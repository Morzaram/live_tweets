defmodule LiveTweets.Tweets.Like do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "likes" do
    field :user_id, :binary_id
    field :liked_tweet_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [:user_id, :liked_tweet_id])
    |> validate_required([:user_id, :liked_tweet_id])
    |> unique_constraint([:user_id, :liked_tweet_id])
  end
end
