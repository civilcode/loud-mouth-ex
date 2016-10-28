defmodule LoudMouthAPI.Directory.PersonControllerTest do
  use LoudMouthAPI.ConnCase, async: true
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

    test "with invalid params", %{conn: conn} do
      person_params = params_for(:directory_person, email: "")

      conn = post conn, directory_person_path(conn, :create), json_for(:person, person_params)

      conn
      |> json_response(422)
      |> assert_errors_on("email")
    end
  end

  describe "GET /directory/people" do
    test "returns a list or people", %{conn: conn} do
      person1 = insert(:directory_person, email: "someone1@example.com")
      person2 = insert(:directory_person, email: "someone2@example.com")

      conn = get conn, directory_person_path(conn, :index)

      person1_json = serialize(person1)
      person2_json = serialize(person2)

      conn
      |> json_response(200)
      |> assert_data(person1_json)
      |> assert_data(person2_json)
    end
  end
end
