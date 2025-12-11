defmodule Mix.Tasks.Day10 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 10 solution.

  ## Usage

      mix day10

  """
  @shortdoc "Run Day 10 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day10.solve()
  end
end
