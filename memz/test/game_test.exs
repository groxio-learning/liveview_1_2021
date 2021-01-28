defmodule Memz.GameTest do
  use ExUnit.Case
  alias Memz.Game
  @paragraph "abcde"
  @steps 2

  test "Memz.Game constructor creates game" do
    assert length(game().plan) == 2
  end

  test "Memz.Game it flows from constructor to reducer" do
    # %Game{plan: [[1, 2], [3, 4, 5]], paragraph: @paragraph}
    game()
    |> assert_key(:plan, [[1, 2, 3], [4, 5]])
    |> assert_key(:paragraph, "abcde")
    |> Game.erase()
    |> assert_key(:plan, [[4, 5]])
    |> assert_key(:paragraph, "___de")
    |> Game.erase()
    |> assert_key(:plan, [])
    |> assert_key(:paragraph, "_____")
  end

  defp game, do: Game.new(@steps, @paragraph, false)

  defp assert_key(game, key, value) do
    assert value == Map.get(game, key)
    game
  end
end
