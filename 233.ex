defmodule Solution do
  @spec count_digit_one(n :: integer) :: integer
  def count_digit_one(n) do
    count_recursive(n |> Integer.to_string |> String.codepoints |> Enum.map(fn codepoint -> String.to_integer(codepoint) end))
  end

  defp count_ones(0) do
    0
  end

  defp count_ones(1) do
    1
  end
  
  defp count_ones(digit_count_limit) do
    10 * count_ones(digit_count_limit - 1) + Integer.pow(10, digit_count_limit - 1)
  end

  defp count_recursive(_digits = []) do
    0
  end

  defp count_recursive([_head = 0 | tail]) do
    count_recursive(tail)
  end

  defp count_recursive([head]) do
    1
  end

  defp count_recursive([_head = 1 | tail]) do
    without_one = count_ones(Enum.count(tail))
    with_one = count_recursive(tail) + (tail |> Enum.join("") |> String.to_integer) + 1
    IO.inspect(without_one)
    IO.inspect(with_one)
    without_one + with_one
  end

  defp count_recursive([head | tail]) do
    without_one = (head - 1) * count_ones(Enum.count(tail)) + count_recursive(tail)
    with_one = count_ones(Enum.count(tail)) + Integer.pow(10, Enum.count(tail))

    without_one + with_one
  end

end
