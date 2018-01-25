defmodule Pru.Mixfile do
  use Mix.Project

  def project do
    [
      name: "Pru",
      source_url: "https://github.com/elcritch/pru",
      description: "Basic library that enables easy interaction with the PRU cores present in the BeagleBone Black.",
      app: :pru,
      version: "0.1.0",
      elixir: "~> 1.5",
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_clean: ["clean"],
      start_permanent: Mix.env == :prod,
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:elixir_make, "~> 0.4.0", runtime: false},
    ]
  end
  defp package do
    [maintainers: ["Mikel Cranfill", "Jaremy Creechley"],
     files: ["lib", "LICENSE", "mix.exs", "README.md"],
     licenses: ["MIT"],
     links: %{"Github" => "https://github.com/elcritch/pru"}]
  end
end
