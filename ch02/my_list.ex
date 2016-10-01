defmodule MyList do
  def flatten([h|t]) do
    flatten(h) ++ flatten(t)
  end
  def flatten(h), do: [h]
  def flatten([]), do: []

  def sum([], result), do: result
  def sum([]), do: 0
  def sum([h|t], result) do
    sum(h, result) + sum(t, result)
  end
  def sum([h|t]) do
    sum(h, 0) + sum(t, 0)
  end
  def sum(h, result), do: h + result
  def sum(h), do: sum(h, 0)
end
