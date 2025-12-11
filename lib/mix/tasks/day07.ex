defmodule Mix.Tasks.Day07 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 7 solution.

  ## Usage

      mix day07

  """
  @shortdoc "Run Day 7 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day07.solve()
  end
end
