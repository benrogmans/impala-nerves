defmodule AdvantechArk1124.MixProject do
  use Mix.Project

  @app :advantech_ark1124
  @version "0.1.0"
  @target "x86_64"

  def project do
    [
      app: @app,
      version: @version,
      target: @target,
      archives: [nerves_bootstrap: "~> 1.10"],
      deps_path: "deps/#{@target}",
      build_path: "_build/#{@target}",
      lockfile: "mix.lock",
      build_embedded: true,
      start_permanent: true,
      aliases: [loadconfig: [&bootstrap/1]],
      deps: deps()
    ]
  end

  def bootstrap(args) do
    set_target()

    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  defp set_target do
    if function_exported?(Mix, :target, 0) do
      apply(Mix, :target, [:x86_64])
    else
      System.put_env("MIX_TARGET", "x86_64")
    end
  end

  def application do
    [
      mod: {AdvantechArk1124.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.10", runtime: false},
      {:shoehorn, "~> 0.9"},
      {:ring_logger, "~> 0.9"},
      {:toolshed, "~> 0.3"},
      {:nerves_runtime, "~> 0.13"},
      {:nerves_pack, "~> 0.7"},
      {:nerves_system_x86_64_ark1124h,
       github: "benrogmans/nerves_system_x86_64_ark1124h",
       branch: "main",
       runtime: false,
       targets: :x86_64,
       nerves: [compile: true]}
    ]
  end
end
