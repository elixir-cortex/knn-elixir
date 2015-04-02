defmodule KNN do

  @doc """
  Compute the knn
  """
  def compute(input, dataset, k \\ 3) do
    KNN.sort(input, dataset)
    |> Enum.take(k)
    |> getTop
  end

  @doc """
  Get top elements from the sorted dataset
  """
  def getTop(dataset) do
    Enum.group_by(dataset, &(elem(&1, 2)))
    |> Enum.max_by(&(length(elem(&1, 1))))
    |> elem(0)
  end

  @doc """
  Sort the dataset by the euclidian distance
  """
  def sort(input, dataset) do
    Enum.sort_by(dataset, &(distance(&1, input)))
  end

  @doc """
  Compute the distance between two points in 2 dimensions
  """
  def distance(a, b) do
    x = elem(a, 0) - elem(b, 0)
    y = elem(a, 1) - elem(b, 1)
    :math.pow(x, 2) + :math.pow(y, 2)
    |> :math.sqrt
  end
end
