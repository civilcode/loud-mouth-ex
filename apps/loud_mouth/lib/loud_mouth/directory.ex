defmodule LoudMouth.Directory do
  @moduledoc """
  Contains the functions for processing use cases related to the Directory.
  """
  alias LoudMouth.Directory.Person
  alias LoudMouth.Repo

  def add_person(params) do
    Person.new
    |> Person.changeset(params)
    |> Repo.insert
  end

  def fetch_person_by_email(email) do
    Person
    |> Repo.get_by(email: email)
  end

  def list_people do
    Repo.all(Person)
  end
end
