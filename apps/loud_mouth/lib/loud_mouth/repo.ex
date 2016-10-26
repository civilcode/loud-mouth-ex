defmodule LoudMouth.Repo do
  alias LoudMouth.Directory.Person

  def insert(_struct) do
  end

  def get_by(_struct, filters \\ []) do
    %Person{email: filters[:email]}
  end
end
