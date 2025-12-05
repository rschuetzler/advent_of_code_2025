defmodule AdventOfCode2025.Days.Day04 do
  @moduledoc """
  Solution for Advent of Code 2025 - Day 4
  """

  alias AdventOfCode2025.Utils.Input

  def solve do
    input =
      Input.read("day04")
      |> prep_inputs()

    result = part1(input)
    IO.inspect(result, label: "Part 1")
    result2 = part2(input)
    IO.inspect(result2, label: "Part 2")
  end

  def part1(inputs) do
    get_removables(inputs)
    |> List.flatten()
    |> Enum.count(fn x -> x == true end)
  end

  def part2(inputs) do
    count_paper(inputs) - count_paper(remove(inputs))
  end

  def prep_inputs(input) do
    # add_index = fn row -> Enum.with_index(row, fn element, index -> {index, element} end) end

    input
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
  end

  def get_value(input, col, row) do
    input
    |> get_row(row)
    |> Enum.at(col)
  end

  def get_row(input, row) do
    input
    |> Enum.at(row)
  end

  def get_neighbors(input, col, row) do
    input_height = length(input)
    input_width = length(Enum.at(input, 1))
    neighbor_cols = (col - 1)..(col + 1) |> Enum.filter(fn x -> x >= 0 and x < input_width end)
    neighbor_rows = (row - 1)..(row + 1) |> Enum.filter(fn x -> x >= 0 and x < input_height end)

    Enum.map(neighbor_rows, fn row ->
      Enum.map(neighbor_cols, fn col -> get_value(input, col, row) end)
    end)
    |> List.flatten()
    |> List.delete(get_value(input, col, row))
  end

  def count_paper_neighbors(neighbors) do
    Enum.count(neighbors, fn x -> x == "@" end)
  end

  def can_remove_paper?(input, col, row) do
    if get_value(input, col, row) == "@" do
      num_neighbors = get_neighbors(input, col, row) |> count_paper_neighbors()
      num_neighbors < 4
    else
      false
    end
  end

  def get_removables(input) do
    Enum.map(0..(length(input) - 1), fn row ->
      Enum.map(0..length(Enum.at(input, 0)), fn col -> can_remove_paper?(input, col, row) end)
    end)
  end

  def count_paper(input) do
    input
    |> List.flatten()
    |> Enum.count(fn x -> x == "@" end)
  end

  def remove_paper(input, removal) do
    Enum.zip_with(input, removal, fn input_row, removal_row ->
      Enum.zip_with(input_row, removal_row, fn i, r -> if r, do: ".", else: i end)
    end)
  end

  def remove(input) do
    removals = get_removables(input)
    new_array = remove_paper(input, removals)

    if get_removables(new_array) |> List.flatten() |> Enum.any?() do
      remove(new_array)
    else
      new_array
    end
  end
end
