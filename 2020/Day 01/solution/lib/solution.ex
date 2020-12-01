defmodule Solution do
  @moduledoc """
  Documentation for `Solution`.
  """

  @doc """
  Puzzle 2 numbers add 2020.

  ## Examples

      iex> Solution.puzzle2([1721,979,366,299,675,1456])
      514579

  """
  def puzzle2(numbers) do
    numbers
    |> Enum.find_value(fn n1 ->
      second =
        numbers
        |> Enum.find(fn n2 ->
          n1 + n2 == 2020
        end)

      if second == nil do
        nil
      else
        n1 * second
      end
    end)
  end

  @doc """
  Puzzle 3 numbers add 2020.

  ## Examples

      iex> Solution.puzzle3([1721,979,366,299,675,1456])
      241861950

  """
  def puzzle3(numbers) do
    numbers
    |> Enum.find_value(fn n1 ->
      second =
        numbers
        |> Enum.find_value(fn n2 ->
          third =
            numbers
            |> Enum.find(fn n3 ->
              n1 + n2 + n3 == 2020
            end)

          if third == nil do
            nil
          else
            third * n2
          end
        end)

      if second == nil do
        nil
      else
        second * n1
      end
    end)
  end

  def realinput do
    {:ok, content} = File.read("/home/marcelo/Code/ma/advent-of-code/2020/Day 01/input")

    numbers =
      content
      |> String.split("\n")
      |> Enum.reject(fn c -> c === "" end)
      |> Enum.map(fn n -> String.to_integer(n) end)

    IO.puts Solution.puzzle2(numbers)
    IO.puts Solution.puzzle3(numbers)
  end
end
