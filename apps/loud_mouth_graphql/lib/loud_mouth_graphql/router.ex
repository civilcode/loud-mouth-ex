defmodule LoudMouthGraphQL.Router do
  use LoudMouthGraphQL.Web, :router

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: LoudMouthGraphQL.Schema
  forward "/", Absinthe.Plug, schema: LoudMouthGraphQL.Schema
end
