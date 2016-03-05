defmodule AlexaWeb.Mixfile do
  use Mix.Project

  def project do
    [app: :alexa_web,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A web endpoint for deploying one or a collection of Amazon Alexa Skills",
     package: package,
     deps: deps]
  end

  def package do
    [
      maintainers: ["Colin Harris"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/col/alexa_web"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :plug, :alexa],
     mod: {AlexaWeb, []}]
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
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:alexa, "~> 0.1.1"}
    ]
  end
end
