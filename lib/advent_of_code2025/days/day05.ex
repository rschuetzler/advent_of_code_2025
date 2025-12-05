defmodule AdventOfCode2025.Days.Day05 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 5
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read_raw("day05-sample")
      |> prep_inputs()

    result = part1(input)
    IO.inspect(result, label: "Part 1")
    result2 = part2(input)
    IO.inspect(result2, label: "Part 2")
  end

  def part1(inputs) do
    inputs
  end

  def part2(inputs) do
    inputs
  end

  def prep_inputs(input) do
    # add_index = fn row -> Enum.with_index(row, fn element, index -> {index, element} end) end
    input
  end
end
