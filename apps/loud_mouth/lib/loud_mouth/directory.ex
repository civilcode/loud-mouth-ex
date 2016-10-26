defmodule LoudMouth.Directory do
  @moduledoc """
  Contains the functions for processing use cases related to the Directory.
  """
  alias LoudMouth.Directory.Person
  alias LoudMouth.Repo

  def add_person(params) do
    params
    |> Person.new
    |> Repo.insert
  end

  def fetch_person_by_email(email) do
    Repo.get_by(Person, email: email)
  end
end
