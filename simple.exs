import Elixir.Sorting
defmodule Math do
  def sum(a, b) do
    a + b
  end

  def zero?(x) do
    x == 0
  end
end

defmodule MyModule do
    def sum_list(xs) when is_list(xs) do
        case xs do
          [] -> 0
          _ -> (hd xs) + sum_list(tl xs)
        end
    end
end
