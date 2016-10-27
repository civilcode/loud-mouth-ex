defmodule LoudMouth.Factory do
  use ExMachina.Ecto, repo: LoudMouth.Repo

  def directory_person_factory do
    %LoudMouth.Directory.Person{
      email: Faker.Internet.safe_email,
      given_name: Faker.Name.first_name,
      family_name: Faker.Name.last_name
    }
  end
end
