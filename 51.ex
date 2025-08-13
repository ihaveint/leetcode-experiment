# I'm starting to see a pattern ...

defmodule Solution do
  @spec solve_n_queens(n :: integer) :: [[String.t]]
  def solve_n_queens(n) do
    solve(n)
  end

  defp put_pieces(coordinates) do
    n = Enum.count(coordinates)
    coordinates
    |> Enum.map(fn {_row, queen_column} ->
        Enum.map(0..n-1, fn column -> if queen_column == column, do: "Q", else: "." end)
        |> Enum.join("")
    end)
  end

  defp no_collision?(_new_queen = {nx, ny}, prev_coordinates) do
    _result = prev_coordinates |> Enum.all?(fn {x, y} -> x != nx and y != ny and abs(x - nx) != abs(y - ny) end)
  end

  defp solve(n) do
    solve(n, n, [])
  end

  defp solve(0, _n, prev_coordinates) do
    [prev_coordinates |> put_pieces]
  end

  defp solve(remaining_rows, n, prev_coordinates) do
    0..n-1
    |> Enum.filter(fn column -> no_collision?({n - remaining_rows, column}, prev_coordinates) end)
    |> Enum.flat_map(fn column ->
        solve(remaining_rows - 1, n, [{n - remaining_rows, column} | prev_coordinates])
    end)  
  end
end
