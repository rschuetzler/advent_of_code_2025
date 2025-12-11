defmodule Mix.Tasks.Day09 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 9 solution.

  ## Usage

      mix day09

  """
  @shortdoc "Run Day 9 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day09.solve()
  end
end
