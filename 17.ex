defmodule Solution do
  @spec letter_combinations(digits :: String.t) :: [String.t]
  def letter_combinations(digits) do
    if digits == "" do
        []
    else
        combinations_recursion(digits |> String.codepoints, []) |> List.flatten
    end
  end
 
  defp letters(digit) do
    case digit do
        "2" -> ["a", "b", "c"]
        "3" -> ["d", "e", "f"]
        "4" -> ["g", "h", "i"]
        "5" -> ["j", "k", "l"]
        "6" -> ["m", "n", "o"]
        "7" -> ["p", "q", "r", "s"]
        "8" -> ["t", "u", "v"]
        "9" -> ["w", "x", "y", "z"]
    end
  end
  defp combinations_recursion([], current_combination) do
    current_combination |> List.to_string
  end

  defp combinations_recursion([first_digit | tail], current_combination) do
    associated_letters = letters(first_digit)
    Enum.map(associated_letters, fn letter -> combinations_recursion(tail, current_combination ++ [letter] |> List.flatten) end)
  end
end
