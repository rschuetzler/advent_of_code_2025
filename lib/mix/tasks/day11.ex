defmodule Mix.Tasks.Day11 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 11 solution.

  ## Usage

      mix day11

  """
  @shortdoc "Run Day 11 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day11.solve()
  end
end
