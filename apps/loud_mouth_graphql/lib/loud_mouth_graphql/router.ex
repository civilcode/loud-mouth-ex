defmodule LoudMouthGraphQL.Router do
  use LoudMouthGraphQL.Web, :router

  scope "/graphql" do
    forward "/inspect", Absinthe.Plug.GraphiQL, schema: LoudMouthGraphQL.Schema
    forward "/", Absinthe.Plug, schema: LoudMouthGraphQL.Schema
  end
end
