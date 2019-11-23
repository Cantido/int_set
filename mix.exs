defmodule IntSet.MixProject do
  use Mix.Project

  def project do
    [
      app: :int_set,
      version: "1.4.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "A time- and memory-efficient unordered data structure for positive integers.",
      package: package(),
      deps: deps(),
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
      {:benchee, "~> 0.11", only: :dev},
      {:stream_data, "~> 0.1", only: :test},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Rosa Richter"],
      licenses: ["GPL v3"],
      links: %{"Github" => "https://github.com/Cantido/int_set"}
    ]
  end
end
