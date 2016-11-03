defmodule LoudMouthGraphQL.Directory.PersonResolver do
  def all(_args, _info) do
    {:ok, LoudMouth.Directory.list_people }
  end

  def create(args, _info) do
    case LoudMouth.Directory.add_person(args) do
      {:ok, person} -> {:ok, person}
      {:error, changeset} -> {:error, errors_from(changeset)}
    end
  end

  def errors_from(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &LoudMouthGraphQL.ErrorHelpers.translate_error/1)
    |> Enum.flat_map(fn {key, errors} -> for msg <- errors, do: "#{key} #{msg}" end)
    |> Enum.join("|")
  end
end
