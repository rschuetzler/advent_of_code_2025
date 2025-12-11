defmodule Mix.Tasks.Day12 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 12 solution.

  ## Usage

      mix day12

  """
  @shortdoc "Run Day 12 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day12.solve()
  end
end
