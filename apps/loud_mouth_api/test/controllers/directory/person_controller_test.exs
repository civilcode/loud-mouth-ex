defmodule LoudMouthAPI.Directory.PersonControllerTest do
  use LoudMouthAPI.ConnCase
  alias LoudMouth.Directory

  describe "POST /directory/person" do
    test "with valid params", %{conn: conn} do
      email = "someone@example.com"
      person_params = params_for(:directory_person, email: email)

      conn = post conn, directory_person_path(conn, :create), json_for(:person, person_params)

      person_json =
        email
        |> Directory.fetch_person_by_email
        |> serialize

      conn
      |> json_response(201)
      |> assert_data(person_json)
    end
  end
end
