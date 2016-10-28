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

  test "listing people" do
    insert(:directory_person, email: "someone1@example.com")
    insert(:directory_person, email: "someone2@example.com")
    insert(:directory_person, email: "someone3@example.com")

    people = Directory.list_people

    assert length(people) == 3
    assert Enum.map(people, &(&1.email)) == ["someone1@example.com", "someone2@example.com", "someone3@example.com"]
  end
end
