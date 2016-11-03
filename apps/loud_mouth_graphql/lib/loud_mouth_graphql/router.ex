defmodule LoudMouthGraphQL.Router do
  use LoudMouthGraphQL.Web, :router

  scope "/graphql" do
    scope "/directory" do
      forward "/inspect", Absinthe.Plug.GraphiQL, schema: LoudMouthGraphQL.Directory.Schema
      forward "/", Absinthe.Plug, schema: LoudMouthGraphQL.Directory.Schema
    end
  end
end
