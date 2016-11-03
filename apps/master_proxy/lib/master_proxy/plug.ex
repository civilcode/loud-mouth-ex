defmodule MasterProxy.Plug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    cond do
      conn.request_path =~ ~r{/backoffice} ->
        LoudMouthBackoffice.Endpoint.call(conn, [])
      conn.request_path =~ ~r{/graphql} ->
        LoudMouthGraphQL.Endpoint.call(conn, [])
      true ->
        LoudMouthAPI.Endpoint.call(conn, [])
    end
  end
end
