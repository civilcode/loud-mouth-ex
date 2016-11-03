defmodule LoudMouthGraphQL.Directory.PersonResolver do
  def all(_args, _info) do
    {:ok, LoudMouth.Directory.list_people }
  end
end
