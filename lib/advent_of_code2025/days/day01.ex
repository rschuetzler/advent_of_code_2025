defmodule AdventOfCode2025.Days.Day01 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 1
  """

  alias AdventOfCode2025.Utils.Input

  @start 50
  @max 99

  def solve do
    input = Input.read("day01")
    result = part1(input)
    IO.puts("Result: #{result}")
    result2 = part2(input)
    IO.puts("Result: #{result2}")
  end

  def part1(inputs) do
    do_the_thing(inputs, @start, 0)
  end

  def part2(inputs) do
    count_all_zeros(inputs, @start, 0)
  end

  defp do_the_thing([input | rest], start_at, zeros) do
    new_value =
      input
      |> convert_input_to_turn()
      |> rotate_dial(start_at)

    zeros =
      case new_value do
        0 ->
          zeros + 1

        _ ->
          zeros
      end

    do_the_thing(rest, new_value, zeros)
  end

  defp do_the_thing([], _final_value, zeros) do
    zeros
  end

  def count_all_zeros([input | rest], start_at, zeros) do
    {new_zeros, new_value} =
      input
      |> convert_input_to_turn()
      |> rotate_dial_and_count(start_at)

    zeros = zeros + new_zeros

    # Add a zero for stopping at zero
    zeros =
      case new_value do
        0 -> zeros + 1
        _ -> zeros
      end

    count_all_zeros(rest, new_value, zeros)
  end

  def count_all_zeros([], _final_value, zeros) do
    zeros
  end

  defp convert_input_to_turn(input) do
    String.split_at(input, 1)
  end

  defp rotate_dial({"L", value}, start_at) do
    distance = String.to_integer(value)
    new_value = start_at - distance
    # IO.puts("Left #{distance}")

    new_value =
      cond do
        new_value < 0 -> Integer.mod(new_value, @max + 1)
        true -> new_value
      end

    new_value
    # IO.inspect(new_value)
  end

  defp rotate_dial({"R", value}, start_at) do
    distance = String.to_integer(value)
    new_value = start_at + distance
    # IO.puts("Right #{distance}")

    new_value =
      cond do
        new_value > @max -> Integer.mod(new_value, @max + 1)
        true -> new_value
      end

    new_value
    # IO.inspect(new_value)
  end

  defp rotate_dial_and_count({"L", value}, start_at) do
    distance = String.to_integer(value)
    new_value = start_at - distance
    zeros = Integer.floor_div(distance, @max + 1)
    IO.puts("Left #{distance}")

    new_value =
      cond do
        new_value < 0 ->
          Integer.mod(new_value, @max + 1)

        true ->
          new_value
      end

    zeros =
      cond do
        start_at == 0 -> zeros
        Integer.mod(distance, 100) > start_at -> zeros + 1
        true -> zeros
      end

    {zeros, new_value}
    IO.inspect({zeros, new_value})
  end

  defp rotate_dial_and_count({"R", value}, start_at) do
    distance = String.to_integer(value)
    new_value = start_at + distance
    zeros = Integer.floor_div(distance, @max + 1)
    IO.puts("Right #{distance}")

    new_value =
      cond do
        new_value > @max ->
          Integer.mod(new_value, @max + 1)

        true ->
          new_value
      end

    zeros =
      cond do
        start_at == 0 -> zeros
        Integer.mod(distance, 100) + start_at > @max + 1 -> zeros + 1
        true -> zeros
      end

    {zeros, new_value}
    IO.inspect({zeros, new_value})
  end
end
