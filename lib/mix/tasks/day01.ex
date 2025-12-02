defmodule Mix.Tasks.Day01 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 1 solution.

  ## Usage

      mix day01

  """
  @shortdoc "Run Day 1 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day01.solve()
  end
end
