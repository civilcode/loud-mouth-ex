defmodule LoudMouthGraphql.Router do
  use LoudMouthGraphql.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LoudMouthGraphql do
    pipe_through :api
  end
end
