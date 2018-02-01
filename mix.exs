defmodule Pru.Mixfile do
  use Mix.Project

  @app :nerves_pru

  def project do
    [
      name: @app,
      description:
        "Basic library that enables easy interaction with the PRU cores present in the BeagleBone Black.",
      app: :pru,
      nerves_package: nerves_package(),
      # archives: [nerves_bootstrap: "~> 0.6"],
      version: "0.3.0",
      elixir: "~> 1.5",
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_clean: ["clean"],
      make_env: %{ "PRU_CGT" => System.user_home() <> "/.nerves/artifacts/extras_toolchain_pru_cgt-portable-0.1.0/ti-cgt-pru/"},
      start_permanent: Mix.env() == :prod,
      package: package(),
      # aliases: aliases(),
      aliases:  [
        "deps.get": ["deps.get", "nerves.deps.get"],
        # "deps.loadpaths": ["nerves.loadpaths", "deps.loadpaths"]
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def aliases("host"), do: []

  def nerves_package do
    [
      name: @app,
      type: :extras,
      platform: Nerves.Toolchain.Extra,
      platform_config: [
      ],
      target_tuple: :arm_unknown_linux_gnueabihf,
      # artifact_sites: [
        # {:github_releases, "elcritch/extras_toolchain_pru_cgt"}
      # ],
      # checksum: package_files()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:elixir_make, "~> 0.4.0", runtime: false},
      # {:nerves, git: "https://github.com/elcritch/nerves.git", branch: "master", override: true },
      {:extras_toolchain_pru_cgt, "~> 0.1", git: "https://github.com/elcritch/extras_toolchain_pru_cgt.git", branch: "v0.1.x"},
    ]
  end

  defp package do
    [
      maintainers: ["Mikel Cranfill", "Jaremy Creechley"],
      files: ["lib", "LICENSE", "mix.exs", "README.md"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/elcritch/pru"}
    ]
  end

  def aliases() do
    [] |> Nerves.Bootstrap.add_aliases()
  end

end
