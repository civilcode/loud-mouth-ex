defmodule LoudMouthAPI.Directory.PersonController do
  use LoudMouthAPI.Web, :controller

  alias LoudMouth.Directory

  def create(conn, %{"data" => %{"type" => "person", "attributes" => person_params}}) do
    case Directory.add_person(person_params) do
      {:ok, person} -> add_person_successful(conn, person)
      {:error, changeset} -> add_person_failed(conn, changeset)
    end
  end

  defp add_person_successful(conn, person) do
    conn
    |> put_status(:created)
    |> render("show.json-api", data: person)
  end

  defp add_person_failed(conn, changeset) do
    conn
    |> put_status(:unprocessable_entity)
    |> render("errors.json-api", data: changeset)
  end

  def index(conn, _params) do
    people = Directory.list_people

    conn
    |> render("index.json-api", data: people)
  end
end
