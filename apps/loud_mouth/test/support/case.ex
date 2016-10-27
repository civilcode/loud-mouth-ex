defmodule LoudMouth.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias LoudMouth.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import LoudMouth.Case
      import LoudMouth.Factory
    end
  end

  setup _context do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(LoudMouth.Repo)
  end
end
