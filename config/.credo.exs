%{
  #
  # You can have as many configs as you like in the `configs:` field.
  configs: [
    %{
      #
      # Run any config using `mix credo -C <name>`. If no config name is given
      # "default" is used.
      name: "default",
      #
      # these are the files included in the analysis
      files: %{
        excluded: [~r"/_build/", ~r"/deps/", ~r"/test/", ~r"/priv/"]
      }
    }
  ]
}
