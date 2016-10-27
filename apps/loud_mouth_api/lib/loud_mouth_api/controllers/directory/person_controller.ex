defmodule LoudMouthAPI.Directory.PersonController do
  use LoudMouthAPI.Web, :controller

  alias LoudMouth.Directory

  def create(conn, %{"person" => person_params}) do
    {:ok, person} = Directory.add_person(person_params)
    conn
    |> put_status(:created)
    |> render("show.json-api", data: person)
  end
end
