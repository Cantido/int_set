# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule IntSet.MixProject do
  use Mix.Project

  def project do
    [
      name: "IntSet",
      app: :int_set,
      version: "1.5.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "A time- and memory-efficient unordered data structure for positive integers.",
      package: package(),
      deps: deps(),
      docs: docs(),
      source_url: "https://github.com/Cantido/int_set",
      dialyzer: [flags: ["-Wunmatched_returns", :error_handling]]
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
      {:benchee_markdown, "~> 0.2", only: :dev},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:stream_data, "~> 0.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_check, "~> 0.14.0", only: [:dev], runtime: false},
      {:doctor, ">= 0.0.0", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md", "LICENSES/*"],
      maintainers: ["Rosa Richter"],
      licenses: ["MIT", "CC-BY-4.0", "CC0-1.0"],
      links: %{
        "Github" => "https://github.com/Cantido/int_set",
        "Sponsor" => "https://liberapay.com/rosa"
      }
    ]
  end

  defp docs do
    [
      main: "IntSet",
      api_reference: false,
      extras: [
        "README.md",
        "CHANGELOG.md",
        "code_of_conduct.md",
        "CONTRIBUTING.md"
      ]
    ]
  end
end
