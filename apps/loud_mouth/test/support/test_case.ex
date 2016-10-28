defmodule LoudMouth.TestCase do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      alias LoudMouth.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import LoudMouth.TestCase
      import LoudMouth.Factory
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(LoudMouth.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(LoudMouth.Repo, {:shared, self()})
    end

    :ok
  end
end
