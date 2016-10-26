defmodule LoudMouth.Directory.Person do
  @moduledoc """
  Contains the schema and functions for a Person.
  TODO: Let's review to see what the scope of functions (i.e. just schema related)
  """
  defstruct [email: nil, given_name: nil, family_name: nil]

  def new(params) do
    struct(__MODULE__, params)
  end
end
