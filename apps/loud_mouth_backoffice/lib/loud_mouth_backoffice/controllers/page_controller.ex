defmodule LoudMouthBackoffice.PageController do
  use LoudMouthBackoffice.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
