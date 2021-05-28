defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end

  def repes(lista) do
    {largo_lista, conjunto} =
      Enum.reduce(
        lista,
        {0, MapSet.new()},
        fn x, {acc, conj} -> {1 + acc, MapSet.put(conj, x)} end
      )

    largo_lista != MapSet.size(conjunto)
  end
  def vacia?([]) do
    true
  end
  def vacia?([x|s]) do
    false
  end
  def fin([x]) do
    x
  end
  def fin([_x|s]) do
	fin(s)
  end
  def comprimir([x|s], {_}) when (not vacia?(s)) do

  end

end
