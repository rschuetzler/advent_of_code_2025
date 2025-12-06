defmodule Mix.Tasks.Day06 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 6 solution.

  ## Usage

      mix day06

  """
  @shortdoc "Run Day 6 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day06.solve()
  end
end
