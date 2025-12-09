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

    input2 =
      Input.read_raw("day06")

    result2 = part2(input2)
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
    |> String.split("\n")
    |> Enum.map(fn row -> String.split(row, "", trim: true) end)
    |> Enum.reject(fn x -> x == [] end)
    |> transpose
    |> process_rows
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

  def process_rows(rows) do
    process_next(%{rows_to_math: [], remaining_rows: rows, current_operation: "", acc: 0})
  end

  def process_next(%{remaining_rows: []} = rows) do
    math_the_rows(rows)
  end

  def process_next(%{remaining_rows: [next | rest]} = rows) do
    IO.inspect(rows)

    rows =
      case List.pop_at(next, -1) do
        {"*", next_row} ->
          %{
            rows
            | remaining_rows: rest,
              rows_to_math: [next_row],
              current_operation: "*",
              acc: math_the_rows(rows)
          }

        {"+", next_row} ->
          %{
            rows
            | remaining_rows: rest,
              rows_to_math: [next_row],
              current_operation: "+",
              acc: math_the_rows(rows)
          }

        {_, next_row} ->
          %{rows | rows_to_math: [next_row | rows.rows_to_math], remaining_rows: rest}
      end

    process_next(rows)
  end

  def math_the_rows(%{rows_to_math: []}) do
    0
  end

  def math_the_rows(%{rows_to_math: rows, current_operation: "*", acc: acc}) do
    rows =
      Enum.map(rows, fn x -> List.to_string(x) |> String.trim() end)
      |> Enum.reject(fn x -> x == "" end)
      |> Enum.map(fn x -> String.to_integer(x) end)

    IO.inspect(rows, label: "Multiplying")
    acc + Enum.product(rows)
  end

  def math_the_rows(%{rows_to_math: rows, current_operation: "+", acc: acc}) do
    rows =
      Enum.map(rows, fn x -> List.to_string(x) |> String.trim() end)
      |> Enum.reject(fn x -> x == "" end)
      |> Enum.map(fn x -> String.to_integer(x) end)

    IO.inspect(rows, label: "Adding")
    acc + Enum.sum(rows)
  end
end
