defmodule Solution do
  @spec search_range(nums :: [integer], target :: integer) :: [integer]
  def search_range(nums, target) do
    if length(nums) == 0 do
      [-1, -1]
    else
      array = :array.from_list(nums)
      size = :array.size(array)

      first_idx = do_binary_search(array, target, 0, size - 1, :first)
      last_idx = do_binary_search(array, target, 0, size - 1, :last)

      if first_idx == -1 do
        [-1, -1]
      else
        [first_idx, last_idx]
      end
    end
  end

  defp do_binary_search(_array, _target, low, high, _mode) when low > high do
    -1
  end

  defp do_binary_search(array, target, low, high, mode) do
    mid = div(low + high, 2)
    mid_val = :array.get(mid, array)

    cond do
      mid_val == target -> 
        case mode do
          :first -> 
            result = do_binary_search(array, target, low, mid - 1, :first)
            if result == -1, do: mid, else: result
          :last ->
            result = do_binary_search(array, target, mid + 1, high, :last)
            if result == -1, do: mid, else: result
        end

      mid_val < target -> 
        do_binary_search(array, target, mid + 1, high, mode)
      
      mid_val > target -> 
        do_binary_search(array, target, low, mid - 1, mode)
    end
  end
end
