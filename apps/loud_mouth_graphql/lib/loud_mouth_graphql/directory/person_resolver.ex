defmodule LoudMouthGraphQL.Directory.PersonResolver do
  def all(_args, _info) do
    {:ok, LoudMouth.Directory.list_people }
  end

  def create(args, _info) do
    LoudMouth.Directory.add_person(args)
  end
end
