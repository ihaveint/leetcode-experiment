# I'll have to come back to this later ...

defmodule Solution do
  @spec combination_sum(candidates :: [integer], target :: integer) :: [[integer]]
  def combination_sum(candidatess, target) do
    recusrive_combinations(candidatess, target, [])
  end

  defp recusrive_combinations(_candidates = [], remaining_target, combinations) do
    if remaining_target == 0 do
        [combinations]
    else
        []
    end
  end

  defp recusrive_combinations(candidates = [head | tail], remaining_target, combination) do
    if remaining_target >= head do
        with_head = recusrive_combinations(candidates, remaining_target - head, combination ++ [head])
        without_head = recusrive_combinations(tail, remaining_target, combination)
        if with_head != [] and without_head != [] do
            with_head ++ without_head
        else
            if with_head == [] do
                without_head
            else
                with_head
            end
        end

    else
        _withuot_head = recusrive_combinations(tail, remaining_target, combination)
    end
  end
end
