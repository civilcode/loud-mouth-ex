defmodule LoudMouth.Directory.Person do
  @moduledoc """
  Contains the schema and functions for a Person.
  TODO: Let's review to see what the scope of functions (i.e. just schema related)
  """
  use LoudMouth.Schema

  schema "directory_people" do
    field :email
    field :given_name
    field :family_name

    timestamps
  end

  def new(params) do
    struct(__MODULE__, params)
  end
end
