defmodule LoudMouthAPI.Router do
  use LoudMouthAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LoudMouthAPI do
    pipe_through :api

    scope "/directory", Directory, as: :directory do
      resources "/person", PersonController, only: [:create]
    end
  end
end
