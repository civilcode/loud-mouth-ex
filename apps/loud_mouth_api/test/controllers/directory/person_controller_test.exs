defmodule LoudMouthAPI.Directory.PersonControllerTest do
  use LoudMouthAPI.ConnCase
  alias LoudMouth.Directory

  describe "POST /directory/person" do
    test "with valid params", %{conn: conn} do
      person_params = %{email: "foo@bar.com", given_name: "John", family_name: "Smith"}

      conn = post conn, directory_person_path(conn, :create), %{person: person_params, format: "json-api"}

      person_json =
        person_params.email
        |> Directory.fetch_person_by_email
        |> serialize

      conn
      |> json_response(201)
      |> assert_data(person_json)
    end
  end
end
