defmodule LoudMouthGraphQL.Schema do
  use Absinthe.Schema
  import_types LoudMouthGraphQL.Schema.Directory.Types

  query do
    field :directory_people, list_of(:person) do
      resolve &LoudMouthGraphQL.Directory.PersonResolver.all/2
    end
  end
end
