defmodule MyApp.MixFile do
  defp defps do
    [
      {:cowboy, "~> 2.6"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
