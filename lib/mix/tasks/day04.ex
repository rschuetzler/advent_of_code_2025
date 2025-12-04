defmodule Mix.Tasks.Day04 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 4 solution.

  ## Usage

      mix day04

  """
  @shortdoc "Run Day 4 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day04.solve()
  end
end
