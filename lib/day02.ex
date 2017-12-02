defmodule Day02 do

  def solve_first do
    {:ok, content} = File.read "./input/day02/input.txt"
    input = String.split(content, "\n", trim: true)
    |> Enum.map(&(String.split &1, "", trim: true))
    find_code input
  end

  defp find_code(input), do: find_code input, 5, []
  defp find_code([], _, digits_found), do: Enum.reverse(digits_found) |> Enum.join |> String.to_integer
  defp find_code([next|rest], start_button, digits_found) do
    found = move next, start_button
    find_code rest, found, [found|digits_found]
  end

  defp move([], pos), do: pos
  defp move([next|rest], pos) when next == "U" and pos > 3, do: move rest, pos - 3
  defp move([next|rest], pos) when next == "D" and pos < 7, do: move rest, pos + 3
  defp move([next|rest], pos) when next == "R" and pos not in [3, 6, 9], do: move rest, pos + 1
  defp move([next|rest], pos) when next == "L" and pos not in [1, 4, 7], do: move rest, pos - 1
  defp move([_|rest], pos), do: move rest, pos

end