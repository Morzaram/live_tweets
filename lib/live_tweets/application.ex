defmodule LiveTweets.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveTweetsWeb.Telemetry,
      # Start the Ecto repository
      LiveTweets.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveTweets.PubSub},
      # Start Finch
      {Finch, name: LiveTweets.Finch},
      # Start the Endpoint (http/https)
      LiveTweetsWeb.Endpoint
      # Start a worker by calling: LiveTweets.Worker.start_link(arg)
      # {LiveTweets.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveTweets.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveTweetsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
