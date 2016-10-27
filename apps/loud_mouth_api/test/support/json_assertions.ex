defmodule LoudMouthAPI.JSONAssertions do
  @moduledoc """
  Functions for asserting JSON-API responses.
  """

  import ExUnit.Assertions

  def assert_errors_on(json_response, field) do
    %{"errors" => errors} = json_response
    error = Enum.find(errors, &error_on?(&1, field))
    assert error, "Expected error for field `#{field}`"
  end

  def error_on?(error, field) do
    case error do
      %{"source" => %{"pointer" => "/data/attributes/" <> ^field}} -> true
      _ -> false
    end
  end
end
