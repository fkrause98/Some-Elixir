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

Sorting.mergeSort([4, 5, 6, 1, 2, 3]) |> IO.inspect()
Sorting.mergeSort([6, 1, 2, 3]) |> IO.inspect()
Sorting.mergeSort([-1, -2, -3, 6, 1, 2, 3]) |> IO.inspect()
Sorting.mergeSort([-1, -2, -3, 6, -1, -2, 44]) |> IO.inspect()

defmodule Euler do
  def multiples(n) do
    cond do
      n == 0 -> 0
      rem(n - 1, 5) == 0 -> n - 1 + multiples(n - 1)
      rem(n - 1, 3) == 0 -> n - 1 + multiples(n - 1)
      true -> multiples(n - 1)
    end
  end
  def fib(n) do
    case n do
      0 -> 1
      1 -> 1
      _ -> fib(n - 1) + fib(n - 2)
    end
  end
  def digit_list(n) do
    cond  do
      n < 10 -> [n]
      n >= 10 ->  ( n |> (div 10) |> digit_list ) ++ [rem(n, 10)]
    end
  end
  def is_palindrome(n) do
    palindrome_list_test  = digit_list n
    palindrome_list_test  == Enum.reverse palindrome_list_test
  end
  def bp(i, j, prod) do
    cond do
      i == 99 -> [prod]
      j == 99 -> bp(i-1, 999, (i-1)*999)
      prod != 1 and is_palindrome(prod) -> [prod] ++ bp(i-1,j-1, i*j)
      true -> bp(i, j-1, i*j)
    end
  end
  def divisible_in_range(n) do
    Enum.reduce([11,13,14,16,17,18,19,20], true, fn x, acc -> acc and (rem(n,x) == 0) end)
  end
  def smallest_div_in_range_aux(n) do
    IO.inspect(n)
    cond do
      divisible_in_range(n) -> (
      n
      )
      true -> smallest_div_in_range_aux(n+1)
    end
  end
  def smallest_div_in_range do
   smallest_div_in_range_aux(1)
  end
end
