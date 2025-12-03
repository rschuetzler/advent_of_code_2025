defmodule AdventOfCode2025.Days.Day02 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 2
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read_raw("day02")
      |> parse_inputs()

    result = part1(input)
    IO.puts("Result: #{result}")
    result2 = part2(input)
    IO.puts("Result: #{result2}")
  end

  def part1(inputs) do
    inputs
    |> Enum.map(fn x -> get_invalid_sum(x) end)
    |> Enum.sum()
  end

  def part2(inputs) do
    inputs
    |> Enum.map(fn x -> get_invalid2_sum(x) end)
    |> Enum.sum()
  end

  def get_invalid_sum(chunk) do
    chunk
    |> get_range()
    |> Enum.filter(fn x -> is_invalid?(x) end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.sum()
  end

  def get_invalid2_sum(chunk) do
    chunk
    |> get_range()
    |> Enum.filter(fn x -> is_invalid2?(x) end)
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.sum()
  end

  def parse_inputs(input) do
    input
    |> String.split(",")
    |> Enum.map(fn x -> String.split(x, "-") end)
  end

  def get_range([start, finish | []]) do
    String.to_integer(start)..String.to_integer(finish)
    |> Enum.to_list()
    |> Enum.map(fn x -> Integer.to_string(x) end)
  end

  # Can't match if there's an odd number of numbers
  defp is_invalid?(id) when rem(byte_size(id), 2) == 1, do: false

  defp is_invalid?(id) do
    String.match?(id, ~r/^(\d+)\1$/)
  end

  defp is_invalid2?(id) do
    String.match?(id, ~r/^(\d+)\1+$/)
  end
end
