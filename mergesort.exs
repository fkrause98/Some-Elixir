defmodule Sorting do
  def mergeSort(xs) do
    {left, right} = Enum.split(xs, div(length(xs), 2))
    merge(mergeSort(left), mergeSort(right))
  end

  defp merge([], ys), do: ys
  defp merge(xs, []), do: xs
  defp merge(xs, ys) do
    cond do
      hd(xs) < hd(ys) -> [hd(xs)] ++ merge(tl(xs), ys)
      hd(xs) >= hd(ys) -> [hd(ys)] ++ merge(xs, tl(ys))
    end
  end
end
