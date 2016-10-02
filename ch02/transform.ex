defmodule Transform do
  def reverse_and_multiply(list) do
    # flatten
    list = List.flatten(list)
    # reverse
    list = Enum.reverse(list, [])
    # multiply
    Enum.map(list, fn(item) -> item*item end)
  end

  def preverse_and_multiply(list) do
    list
    |> List.flatten
    |> Enum.reverse([])
    |> Enum.map(fn(item) -> item * item end)
  end

end
