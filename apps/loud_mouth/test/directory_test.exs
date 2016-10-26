defmodule LoudMouth.DirectoryTest do
  use ExUnit.Case

  alias LoudMouth.Directory
  alias LoudMouth.Directory.Person

  test "adding a person" do
    email = "foo@bar.com"
    Directory.add_person(%{email: email, given_name: "John", family_name: "Doe"})

    person = Directory.fetch_person_by_email(email)
    assert person
    assert %Person{email: ^email} = person
  end
end
