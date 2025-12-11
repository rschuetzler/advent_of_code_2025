defmodule Mix.Tasks.Day08 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 8 solution.

  ## Usage

      mix day08

  """
  @shortdoc "Run Day 8 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day08.solve()
  end
end
