defmodule LoudMouthGraphQL.Directory.Schema do
  use Absinthe.Schema
  import_types LoudMouthGraphQL.Directory.Schema.Types
  alias LoudMouthGraphQL.Directory.PersonResolver

  query do
    @desc "List of people"
    field :people, list_of(:person) do
      resolve &PersonResolver.all/2
    end
  end

  mutation do
    @desc "Add a person"
    field :add_person, type: :person do
      arg :given_name, non_null(:string)
      arg :family_name, non_null(:string)
      arg :email, non_null(:string)

      resolve &PersonResolver.create/2
    end
  end
end
