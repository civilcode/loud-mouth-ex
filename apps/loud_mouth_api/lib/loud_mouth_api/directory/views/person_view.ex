defmodule LoudMouthAPI.Directory.PersonView do
  use LoudMouthAPI.Web, :view

  use JaSerializer.PhoenixView
  attributes [:email, :given_name, :family_name]
end
