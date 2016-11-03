defmodule LoudMouthGraphQL.Schema.Directory.Types do
  use Absinthe.Schema.Notation

  object :person do
    field :id, :id
    field :email, :string
  end
end
