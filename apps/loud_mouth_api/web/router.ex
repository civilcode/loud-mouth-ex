defmodule LoudMouthAPI.Router do
  use LoudMouthAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LoudMouthAPI do
    pipe_through :api
  end
end
