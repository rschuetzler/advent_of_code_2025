defmodule AdventOfCode2025.Days.Day06 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 6
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read("day06")
      |> prep_input()

    result = part1(input)
    IO.inspect(result, label: "Part 1")
    result2 = part2(input)
    IO.inspect(result2, label: "Part 2")
  end

  def part1(input) do
    {operations, lists} =
      input
      |> List.pop_at(length(input) - 1)

    lists
    |> transpose()
    |> Enum.map(fn row -> Enum.map(row, fn x -> String.to_integer(x) end) end)
    |> make_operation_tuples(operations)
    |> Enum.map(fn x ->
      if elem(x, 0) == "*" do
        Enum.product(elem(x, 1))
      else
        Enum.sum(elem(x, 1))
      end
    end)
    |> Enum.sum()
  end

  def part2(input) do
    input
  end

  def prep_input(input) do
    input
    |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
  end

  def transpose(items) do
    items
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def make_operation_tuples(lists, operations) do
    Enum.zip(operations, lists)
  end
end
