defmodule Pru.Mixfile do
  use Mix.Project

  @app :nerves_pru_support

  def project do
    [
      name: @app,
      description:
        "Basic library that enables easy interaction with the PRU cores present in the BeagleBone Black.",
      app: @app,
      nerves_package: nerves_package(),
      archives: [nerves_bootstrap: "~> 0.6"],
      version: "0.3.0",
      elixir: "~> 1.5",
      compilers: [:elixir_make] ++ Mix.compilers(),
      #compilers: [:nerves_package, :elixir_make] ++ Mix.compilers(),
      make_clean: ["clean"],
      # make_env: %{ "PRU_CGT" => System.user_home() <> "/.nerves/artifacts/extras_toolchain_pru_cgt-portable-0.1.0/ti-cgt-pru/"},
      start_permanent: Mix.env() == :prod,
      package: package(),
      # aliases: aliases(),
       aliases:  [
        "deps.get": ["deps.get", "nerves.deps.get"],
        "compile": ["nerves.env", "compile"],
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
      app: @app,
      name: @app,
      type: :extras_toolchain_support,
      platform: Nerves.System.ToolchainExtras,
      toolchain_extras: [
        env_var: "PRU_LIB",
        build_link_path: "",
        boostrap_override: fn pkg -> System.put_env("PRU_LIB", pkg.path <> "/priv" ) end,
      ],
      platform_config: [
      ],
      target_tuple: :arm_unknown_linux_gnueabihf,
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:elixir_make, "~> 0.4.0", runtime: false},
      # {:nerves, git: "https://github.com/elcritch/nerves.git", branch: "master", override: true },
      # {:toolchain_extras_pru_cgt, "~> 0.2", git: "https://github.com/elcritch/extras_toolchain_pru_cgt.git", branch: "v0.2.x"},
      {:toolchain_extras_pru_cgt, "~> 0.2", git: "https://github.com/elcritch/extras_toolchain_pru_cgt.git", branch: "v0.2.x-host_tools_fork"},
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
