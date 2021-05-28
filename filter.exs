defmodule Filter do
  def filter_in(from, to, n) do
    for i <- from..to, rem(i, n) == 0, do: i
  end

  def filter_out(from, to, n) do
    for i <- from..to, rem(i, n) != 0, do: i
  end

  def filter_in_values(from, to, {min, max}) do
    for i <- from..to, min <= i, i <= max, do: i
  end
end

defmodule Lists do
  def reverse([]) do
    []
  end

  def reverse([x]) do
    [x]
  end

  def reverse([x | xs]) do
    reverse(xs) ++ [x]
  end

  def rmconsecutive([]) do
    []
  end

  def rmconsecutive([x, x | xs]) do
    rmconsecutive([x | xs])
  end

  def rmconsecutive([x | xs]) do
    [x] ++ rmconsecutive(xs)
  end
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)
  def fib_to_x(x) do
    Enum.map((for i <- 1..x, do: i) fn x -> fib(x) end)
  end
  def sum_fib_even(x) do
    Enum.reduce(fib_to_x(x), 0, (fn x, acc -> acc + x*rem(x-1,2) end))
   end
  def my_reduce(func, [x,y|xs]) do
    my_reduce(func.(x,my_reduce([y|xs])))
  end
  def my_reduce(func, [x,y]) do
    func.(x,y)
  end
end

# IO.inspect(Filter.filter_in(1,100,7))
# IO.inspect(Filter.filter_out(1,100,7))
# IO.inspect(Filter.filter_in_values(1,100,{25,38}))
# IO.inspect(Lists.reverse([1, 2, 3, 4]))
# IO.inspect(Lists.rmconsecutive([1, 2, 3, 4]))
IO.inspect(Lists.rmconsecutive([1, 1, 1, [1, 2, 3], [1, 2, 3], 1, 2, 3, 3, -5]))
IO.inspect(my_reduce(fn x,y -> x+y end, [1,2,3,4]))
