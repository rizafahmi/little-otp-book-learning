defmodule MyList do
  def flatten([]), do: []
  def flatten([h|t]) do
    flatten(h) ++ flatten(t)
  end
  def flatten(h), do: [h]

  def sum([], result \\ 0), do: result
  def sum([h|t], result) do
    sum(h, result) + sum(t, result)
  end
  def sum(h, result), do: h + result
end
