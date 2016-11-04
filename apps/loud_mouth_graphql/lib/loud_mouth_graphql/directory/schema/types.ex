defmodule LoudMouthGraphQL.Directory.Schema.Types do
  @moduledoc false
  use Absinthe.Schema.Notation

  object :person do
    field :id, :id
    field :email, :string
    field :given_name, :string
    field :family_name, :string
  end
end
