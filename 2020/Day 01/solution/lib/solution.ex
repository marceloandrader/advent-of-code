defmodule Solution do
  @moduledoc """
  Documentation for `Solution`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Solution.puzzle1([1721,979,366,299,675,1456])
      514579

  """
  def puzzle1(numbers) do
    Enum.find_value(
      numbers,
      fn n1 ->
        second = Enum.find(
          numbers,
          fn n2 ->
            n1 + n2 == 2020
          end
        )
        if (second == nil)  do
          nil
          else
          n1 * second
        end
      end
    )
  end

  def realinput do
    {:ok, content} = File.read("/home/marcelo/Code/ma/advent-of-code/2020/Day 01/input")
    numbers = content
              |> String.split("\n")
              |> Enum.reject(fn c -> c === "" end)
              |> Enum.map(fn n -> String.to_integer(n) end)


    Solution.puzzle1(numbers)
  end
end
