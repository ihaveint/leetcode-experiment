defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t]) :: String.t
  def longest_common_prefix(strs) do
    case strs do
    [] -> ""
    [s] -> s
    _ ->
        strs
        |> Enum.map(&String.to_charlist/1)
        |> Enum.zip()
        |> Enum.take_while(fn chars_at_pos ->
            first_char = elem(chars_at_pos, 0)
            
            chars_at_pos
            |> Tuple.to_list()
            |> Enum.all?(&(&1 == first_char))
        end)
        |> Enum.map(&elem(&1, 0))
        |> List.to_string()
    end
  end
end
