defmodule Smoke.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Smoke.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Smoke.PubSub}
      # Start a worker by calling: Smoke.Worker.start_link(arg)
      # {Smoke.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Smoke.Supervisor)
  end
end
