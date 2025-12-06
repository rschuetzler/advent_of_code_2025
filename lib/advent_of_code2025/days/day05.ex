defmodule AdventOfCode2025.Days.Day05 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 5
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read_raw("day05")
      |> prep_inputs()

    result = part1(input |> make_ranges())
    IO.inspect(result, label: "Part 1")
    result2 = part2(input)
    IO.inspect(result2, label: "Part 2")
  end

  def part1(input) do
    input.available
    |> Enum.filter(fn x -> is_fresh?(input, x) end)
    |> Enum.count()

    # input.available
    # |> Enum.filter(fn x -> x in input.fresh end)
    # |> Enum.count()
  end

  def part2(input) do
    input.fresh
  end

  def prep_inputs(input) do
    fresh =
      input
      |> String.split("\n\n")
      |> List.first()
      |> String.split("\n")
      |> Enum.map(fn x -> String.split(x, "-") |> Enum.map(fn y -> String.to_integer(y) end) end)

    available =
      input
      |> String.split("\n\n")
      |> List.last()
      |> String.split("\n")
      |> Enum.map(fn x -> String.to_integer(x) end)

    %{fresh: fresh, available: available}
  end

  def make_ranges(%{fresh: fresh} = input) do
    fresh =
      fresh
      |> Enum.map(fn [x, y | _] -> x..y end)
      |> List.flatten()

    %{input | fresh: fresh}
  end

  def is_fresh?(input, item) do
    Enum.any?(input.fresh, fn x -> item in x end)
  end

  def merge_duplicates(fresh) do
  end
end
