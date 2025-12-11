defmodule AdventOfCode2025.Days.Day10 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 10
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read("day10-sample")

    result = part1(input)
    IO.inspect(result, label: "Part 1")

    result2 = part2(input)
    IO.inspect(result2, label: "Part 2")
  end

  def part1(input) do
    input
    |> Enum.map(fn x -> IO.inspect(x) end)
  end

  def part2(input) do
    input
  end
end
