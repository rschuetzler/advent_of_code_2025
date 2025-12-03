defmodule AdventOfCode2025.Days.Day03 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 3
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read("day03")
      |> prep_inputs()

    result = part1(input)
    IO.inspect(result, label: "Part 1")
    result2 = part2(input)
    IO.inspect(result2, label: "Part 2")
  end

  def part1(inputs) do
    inputs
    |> Enum.map(fn x -> find_biggest_number(x) end)
    |> Enum.sum()
  end

  def part2(inputs) do
    inputs
    |> Enum.map(fn x -> find_biggest_number(x, [], 12) end)
    |> Enum.sum()
  end

  def prep_inputs(inputs) do
    inputs
    |> Enum.map(fn x ->
      x |> String.split("", trim: true) |> Enum.map(fn y -> String.to_integer(y) end)
    end)
  end

  # Having digits come before so_far would save an argument above, but
  # I'm lazy, and this works
  def find_biggest_number(input, so_far \\ [], digits \\ 2)

  def find_biggest_number(_input, so_far, digits) when length(so_far) == digits do
    {_, final_number} =
      so_far
      |> Enum.map_reduce("", fn x, acc -> {x, acc <> Integer.to_string(x)} end)

    String.to_integer(final_number)
  end

  def find_biggest_number(input, so_far, digits) do
    len = length(input)
    digits_left = digits - length(so_far)

    next_digit =
      input
      |> Enum.slice(0..(len - digits_left))
      |> Enum.max()

    next_index = Enum.find_index(input, fn x -> x == next_digit end)

    new_slice = input |> Enum.slice((next_index + 1)..len)
    find_biggest_number(new_slice, so_far ++ [next_digit], digits)
  end
end
