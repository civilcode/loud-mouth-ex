defmodule LoudMouth.DirectoryTest do
  use LoudMouth.TestCase, async: true

  alias LoudMouth.Directory
  alias LoudMouth.Directory.Person

  test "adding a person" do
    email = "someone@example.com"
    params = params_for(:directory_person, email: email)

    Directory.add_person(params)

    person = Directory.fetch_person_by_email(email)
    assert person
    assert %Person{email: ^email} = person
  end
end
