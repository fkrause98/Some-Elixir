defmodule Lisp99 do
  def my_last([x]) do
	x
  end
  def my_last([_x|xs]) do
    my_last(xs)
  end
  def my_but_last([x,y]) do
    [x,y]
  end
  def my_but_last([x]) do
    [x]
  end
  def my_but_last(xs) do
    my_but_last(tl xs)
  end
  def kth_element([x|_], 1), do: x
  def kth_element([_x|xs], k) do
    kth_element(xs, k-1)
  end
  def reverse([]), do: []
  def reverse([x|xs]), do: reverse(xs)++[x]
  def flatten([]), do: []
  def flatten([x|xs]) do
    cond do
      is_list(x) -> flatten(x) ++ flatten(xs)
      not(is_list(x)) -> [x] ++ flatten(xs)
    end
  end
  def compress_aux([]), do: []
  def compress_aux([x|xs], elem) do
   cond do
      x == elem -> compress_aux([xs], x)
      x != elem -> [x] ++ compress_aux([xs], x)
      elem == [] -> []
    end
  end
end
# IO.puts("#{Lisp99.my_last([1,2,3])}")
# IO.inspect(Lisp99.my_but_last([1,2,3,4]))
# IO.inspect(Lisp99.kth_element([1,2,3,4], 3))
# IO.inspect(Lisp99.reverse([1,2,3,4,5]))
# IO.inspect(Lisp99.flatten([1,[2,[3]],4,5]))
# IO.inspect(Lisp99.compress_aux([1,1,1,3], 1))
