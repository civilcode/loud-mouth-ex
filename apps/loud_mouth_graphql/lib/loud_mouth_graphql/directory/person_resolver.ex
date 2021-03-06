defmodule LoudMouthGraphQL.Directory.PersonResolver do
  @moduledoc false
  def all(_args, _info) do
    {:ok, LoudMouth.Directory.list_people}
  end

  def get_by_email(%{email: email}, _info) do
    {:ok, LoudMouth.Directory.fetch_person_by_email(email)}
  end

  def create(args, _info) do
    case LoudMouth.Directory.add_person(args) do
      {:ok, person} -> {:ok, person}
      {:error, changeset} -> {:error, errors_from(changeset)}
    end
  end

  def errors_from(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&LoudMouthGraphQL.ErrorHelpers.translate_error/1)
    |> Enum.flat_map(fn {key, errors} -> for msg <- errors, do: "#{key} #{msg}" end)
    |> Enum.join("|")
  end
end
