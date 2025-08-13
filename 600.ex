# call it magic ...

defmodule Solution do
  @spec find_integers(n :: integer) :: integer
  def find_integers(n) do
    binary_representation = Integer.to_string(n, 2)
    codepoints = binary_representation |> String.codepoints() 
    recursive_solve(codepoints, false, false)
  end


  defp recursive_solve([], _force, _override) do
    1
  end

  defp recursive_solve([_head | tail], _force = true, _override = true) do
      recursive_solve(tail, false, true)
  end

  defp recursive_solve([_head | tail], _force = false, _override = true) do
    recursive_solve(tail, true, true) + recursive_solve(tail, false, true)
  end

  
  defp recursive_solve(["1" | tail], _force = true, _override = false) do
      recursive_solve(tail, false, true)
  end

  defp recursive_solve(["1" | tail], _force = false, _override = false) do
    recursive_solve(tail, true, false) + recursive_solve(tail, false, true)
  end


  defp recursive_solve(["0" | tail], _force, _override = false) do
    recursive_solve(tail, false, false)
  end
end
