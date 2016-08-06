defmodule Fallout_4Tracker do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(Fallout_4Tracker.Endpoint, []),
      # Start the Ecto repository
      supervisor(Fallout_4Tracker.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(Fallout_4Tracker.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fallout_4Tracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Fallout_4Tracker.Endpoint.config_change(changed, removed)
    :ok
  end
end
