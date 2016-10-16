defmodule CowboyRestExample.Mixfile do
  use Mix.Project

  def project do
    [app: :cowboy_rest_example,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :timex, :mariaex, :ecto, :remix], 
     mod: {CowboyRestExample, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0"},
     {:timex, "~> 3.0"},
     {:uuid, "~> 1.1"},
     {:ecto, "~> 2.0"},
     {:mariaex, "~> 0.7.7"},
     {:timex_ecto, "~> 3.0"},
     {:poison, "~> 2.2"},
     {:remix, "~> 0.0.2", only: :dev}
    ]
  end


  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
