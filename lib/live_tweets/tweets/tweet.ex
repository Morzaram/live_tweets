defmodule LiveTweets.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tweets" do
    field :body, :string
    field :status, Ecto.Enum, values: [:draft, :published, :deleted]
    field :user_id, :binary_id
    field :retweet_id, :binary_id
    field :liked_tweet_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:body, :status])
    |> validate_required([:body, :status])
  end
end
