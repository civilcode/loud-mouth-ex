defmodule LoudMouthGraphQL.Directory.Schema do
  use Absinthe.Schema
  import_types LoudMouthGraphQL.Directory.Schema.Types

  query do
    field :people, list_of(:person) do
      resolve &LoudMouthGraphQL.Directory.PersonResolver.all/2
    end
  end
end
