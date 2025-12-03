defmodule Mix.Tasks.Day03 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 3 solution.

  ## Usage

      mix day03

  """
  @shortdoc "Run Day 3 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day03.solve()
  end
end
