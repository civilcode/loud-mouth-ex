ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(LoudMouth.Repo, :manual)

{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:faker)
