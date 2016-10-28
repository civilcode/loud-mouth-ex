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
    emails = ["someone1@example.com", "someone2@example.com", "someone3@example.com"]
    insert_people_with_email(emails)

    people = Directory.list_people

    assert length(people) == length(emails)
    actual_emails = Enum.map(people, &(&1.email))
    assert actual_emails == emails
  end

  defp insert_people_with_email(emails) do
    Enum.each(emails, fn(email) ->   insert(:directory_person, email: email) end)
  end
end
