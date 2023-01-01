defmodule LiveTweets.Follower do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "followers" do

    field :follower_id, :binary_id
    field :following_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(follower, attrs) do
    follower
    |> cast(attrs, [])
    |> validate_required([])
  end
end
