defmodule LiveTweets.TweetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveTweets.Tweets` context.
  """

  @doc """
  Generate a tweet.
  """
  def tweet_fixture(attrs \\ %{}) do
    {:ok, tweet} =
      attrs
      |> Enum.into(%{
        body: "some body",
        status: :draft
      })
      |> LiveTweets.Tweets.create_tweet()

    tweet
  end
end
