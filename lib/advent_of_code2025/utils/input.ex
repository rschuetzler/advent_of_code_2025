defmodule AdventOfCode2025.Utils.Input do
  @moduledoc """
  Utilities for reading and processing Advent of Code input files.
  """

  @input_folder Path.expand("../../../input", __DIR__)

  @doc """
  Reads an input file and returns a list of lines.

  ## Examples

      iex> AdventOfCode2025.Utils.Input.read("day01")
      ["line1", "line2", ...]
  """
  def read(day) do
    file_path =
      @input_folder
      |> Path.join("#{day}.txt")

    case File.read(file_path) do
      {:ok, contents} ->
        contents
        |> String.trim()
        |> String.split("\n")

      {:error, reason} ->
        raise "Failed to read input file #{day}.txt: #{inspect(reason)}"
    end
  end

  @doc """
  Reads an input file and returns the raw string content.
  """
  def read_raw(day) do
    file_path =
      @input_folder
      |> Path.join("#{day}.txt")

    case File.read(file_path) do
      {:ok, contents} -> contents
      {:error, reason} -> raise "Failed to read input file #{day}.txt: #{inspect(reason)}"
    end
  end
end
