defmodule KNNTest do
  use ExUnit.Case

  @dataset [
    {303, 3, "banana"},
    {370, 1, "apple"},
    {298, 3, "banana"},
    {277, 3, "banana"},
    {377, 4, "apple"},
    {299, 3, "banana"},
    {382, 1, "apple"},
    {374, 4, "apple"},
    {303, 4, "banana"},
    {309, 3, "banana"},
    {359, 1, "apple"},
    {366, 1, "apple"},
    {311, 3, "banana"},
    {302, 3, "banana"},
    {373, 4, "apple"},
    {305, 3, "banana"},
    {371, 3, "apple"},
  ]

  test "should compute euclidian distance in N dimension" do
    assert KNN.distance({1, 2}, {5, 5}) == 5
  end

  test "should the dataset by distance to an input" do
    input = hd(@dataset)
    sorted_list = KNN.sort(input, @dataset)
    assert hd(sorted_list) == input
  end


  test "should compute the KNN" do
    assert KNN.compute({303, 4}, @dataset) == "banana"
  end
end
