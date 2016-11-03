defmodule LoudMouthGraphQL.Endpoints.DirectoryTest do
  use LoudMouthGraphQL.ConnCase

  test "200 OK", %{conn: conn} do
    person1 = insert(:directory_person, email: "someone1@example.com")
    person2 = insert(:directory_person, email: "someone2@example.com")

    conn = get conn, "/graphql/directory/?query=query+{people{id+email}}"

    [person1_as_json, person2_as_json] =
      conn
      |> json_response(200)
      |> get_in(["data", "people"])

    assert_field(person1_as_json, "email", person1.email)
    assert_field(person2_as_json, "email", person2.email)
  end

  defp assert_field(json_representation, field, value) do
    assert %{^field => ^value} = json_representation
  end

  describe "adding a person to the directory" do
    test "with valid params", %{conn: conn} do
      email = "someone@example.com"
      person_params = params_for(:directory_person, email: email)
      mutation = ~s[
        mutation AddPerson {
          person(
            given_name: "#{person_params.given_name}"
            family_name: "#{person_params.family_name}"
            email: "#{person_params.email}"
          ) {
            email
          }
        }
      ]

      conn = post conn, "/graphql/directory", query: mutation

      person_as_json =
        conn
        |> json_response(200)
        |> get_in(["data", "person"])

      assert_field(person_as_json, "email", person_params.email)
    end
  end
end
