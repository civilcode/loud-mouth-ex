defmodule LoudMouthGraphQL.Router do
  use LoudMouthGraphQL.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LoudMouthGraphQL do
    pipe_through :api
  end
end
