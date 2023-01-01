defmodule LiveTweets.Tweets.Retweet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "retweets" do
    field :body, :string
    field :status, Ecto.Enum, values: [:draft, :published, :deleted]
    field :user_id, :binary_id
    field :retweet_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(retweet, attrs) do
    retweet
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
