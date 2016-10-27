defmodule LoudMouth.Directory.PersonTest do
  use ExUnit.Case
  import ValidField

  alias LoudMouth.Directory.Person

  test "changeset" do
    %Person{}
    |> with_changeset
    |> assert_valid_field(:email, ["something@else.com"])
    |> assert_invalid_field(:email, ["", nil])
  end
end
