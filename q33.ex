defmodule Solution do
  @spec search(nums :: [integer], target :: integer) :: integer
  def search(nums, target) do
    array = :array.from_list(nums)
    size = :array.size(array)

    do_search(array, target, 0, size - 1)
  end

  defp do_search(_array, _target, low, high) when low > high do
    -1
  end

  defp do_search(array, target, low, high) do
    mid = div(low + high, 2)

    mid_val = :array.get(mid, array)

    if mid_val == target do
        mid
    else
        low_val = :array.get(low, array)
        if low_val <= mid_val do
            if low_val <= target and target < mid_val do
                do_search(array, target, low, mid - 1)
            else
                do_search(array, target, mid + 1, high)
            end
        else
            high_val = :array.get(high, array)
            if mid_val < target and target <= high_val do
                do_search(array, target, mid + 1, high)
            else
                do_search(array, target, low, mid - 1)
            end
        end
    end
  end
end
