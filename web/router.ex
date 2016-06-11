defmodule Fallout_4Tracker.Router do
  use Fallout_4Tracker.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Fallout_4Tracker do
    pipe_through :api
  end
end
