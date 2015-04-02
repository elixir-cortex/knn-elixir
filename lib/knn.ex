defmodule KNN do

  @doc """
  Compute the knn
  """
  def compute(input, dataset, k \\ 3) do
    KNN.sort(input, dataset)
    |> takeK(k)
    |> getTop
  end

  @doc """
  Get top elements from the sorted dataset
  """
  def getTop(dataset) do
    Enum.group_by(dataset, fn(data) -> elem(data, 2) end)
    |> Enum.max_by(fn(x) -> length(elem(x, 1)) end)
    |> elem(0)
  end

  @doc """
  Return top K elements
  """
  def takeK(dataset, k \\ 3), do: Enum.take(dataset, k)

  @doc """
  Sort the dataset by the euclidian distance
  """
  def sort(input, dataset) do
    Enum.sort_by(dataset, fn(data) -> distance(input, data) end)
  end

  @doc """
  Compute the distance between two points in 2 dimensions
  """
  def distance(a, b) do
    x0 = elem(a, 0)
    y0 = elem(a, 1)
    x1 = elem(b, 0)
    y1 = elem(b, 1)
    :math.pow(x0 - x1, 2) + :math.pow(y0 - y1, 2)
    |> :math.sqrt
  end
end
