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

  def new do
    %__MODULE__{}
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :given_name, :family_name])
    |> validate_required(:email)
  end
end
