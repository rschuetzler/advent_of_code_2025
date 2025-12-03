defmodule Mix.Tasks.Day02 do
  @moduledoc """
  Mix task to run Advent of Code 2025 - Day 2 solution.

  ## Usage

      mix day02

  """
  @shortdoc "Run Day 2 solution"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    AdventOfCode2025.Days.Day02.solve()
  end
end
