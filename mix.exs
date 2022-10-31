defmodule ZeebeGateway.MixProject do
  use Mix.Project

  @source_url "https://github.com/leobessa/zeebe-gateway-exprotobuf"
  @version_file Path.join(__DIR__, ".version")
  @external_resource @version_file
  @version (case Regex.run(~r/^v([\d\.\w-]+)/, File.read!(@version_file), capture: :all_but_first) do
              [version] -> version
              nil -> "0.1.0"
            end)

  def project do
    [
      app: :zebee_gateway_exprotobuf,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      source_url: @source_url,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:exprotobuf, "~> 1.2"},
      {:gpb, "~> 4.19"}
    ]
  end

  defp package do
    [
      name: "spear",
      files: ~w(lib mix.exs README.md .version),
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => @source_url <> "/blob/main/CHANGELOG.md"
      }
    ]
  end
end
