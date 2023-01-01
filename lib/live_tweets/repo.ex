defmodule LiveTweets.Repo do
  use Ecto.Repo,
    otp_app: :live_tweets,
    adapter: Ecto.Adapters.Postgres
end
