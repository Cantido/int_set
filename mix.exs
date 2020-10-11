defmodule IntSet.MixProject do
  use Mix.Project

  def project do
    [
      name: "IntSet",
      app: :int_set,
      version: "1.5.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "A time- and memory-efficient unordered data structure for positive integers.",
      package: package(),
      deps: deps(),
      docs: docs(),
      source_url: "https://github.com/Cantido/int_set",
      dialyzer: [flags: ["-Wunmatched_returns", :error_handling, :race_conditions]]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.0", only: :dev},
      {:stream_data, "~> 0.1", only: :test},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md", "LICENSE", "benchmark.txt"],
      maintainers: ["Rosa Richter"],
      licenses: ["GPL v3"],
      links: %{"Github" => "https://github.com/Cantido/int_set"}
    ]
  end

  defp docs do
    [
      main: "IntSet",
      extras: ["README.md", "CHANGELOG.md", "benchmark.txt"]
    ]
  end
end
