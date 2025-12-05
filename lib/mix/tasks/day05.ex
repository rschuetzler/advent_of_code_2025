defmodule Mix.Tasks.Day05 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 5 solution.

  ## Usage

      mix day05

  """
  @shortdoc "Run Day 5 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day05.solve()
  end
end
