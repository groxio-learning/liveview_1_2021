defmodule Memz.GameTest do
  use ExUnit.Case
  alias Memz.Game
  @paragraph "abcde"
  @steps 2

  test "Memz.Game constructor creates game" do
    assert length(game().plan) == 2
  end

  test "Memz.Game it flows from constructor to reducer" do
    %Game{plan: [[1, 2], [3, 4, 5]], paragraph: @paragraph}
    |> assert_key(:plan, [[1, 2], [3, 4, 5]])
    |> assert_key(:paragraph, "abcde")
    |> Game.erase()
    |> assert_key(:plan, [[3, 4, 5]])
    |> assert_key(:paragraph, "__cde")
    |> Game.erase()
    |> assert_key(:plan, [])
    |> assert_key(:paragraph, "_____")
  end

  defp game, do: Game.new(@steps, @paragraph)

  defp assert_key(game, key, value) do
    assert value == Map.get(game, key)
    game
  end
end
