defmodule Day01 do

  def solve_first do
    {:ok, content} = File.read "./input/day01/input.txt"
    input = String.trim(content)
    |> String.split(", ")
    |> Enum.map(&({String.slice(&1, 0, 1), String.to_integer(String.slice(&1, 1, String.length(&1) - 1))}))
    facing = :north
    count_blocks input, facing, 0
  end

  defp count_blocks([], _, sum), do: sum
  defp count_blocks([{direction, steps}|rest], facing, sum) do
    now_facing = turn direction, facing
    new_sum = sum + walk(now_facing, steps)
    count_blocks rest, now_facing, new_sum
  end

  defp walk(facing, steps) when facing == :north or facing == :east, do: steps
  defp walk(facing, steps) when facing == :south or facing == :west, do: -steps

  defp turn(direction, facing) do
    case facing do
      :north when direction == "R" ->
        :east
      :north when direction == "L" ->
        :west
      :east when direction == "R" ->
        :south
      :east when direction == "L" ->
        :north
      :south when direction == "R" ->
        :west
      :south when direction == "L" ->
        :east
      :west when direction == "R" ->
        :north
      :west when direction == "L" ->
        :south
    end
  end

end