defmodule Memz.Game do
  defstruct steps_total: 4, plan: [], paragraph: ""

  def new(steps, paragraph, shuffle \\ true) do
    chunk = ceil(String.length(paragraph) / steps)
    plan = build_plan(shuffle, paragraph, chunk)
    %__MODULE__{paragraph: paragraph, plan: plan}
  end

  defp build_plan(shuffle, paragraph, chunk) do
    1..String.length(paragraph)
    |> maybe_shuffle(shuffle)
    |> Enum.chunk_every(chunk)
  end

  defp maybe_shuffle(list, true) do
    Enum.shuffle(list)
  end

  defp maybe_shuffle(list, false) do
    list
  end

  def erase(%{plan: [current | plan], paragraph: paragraph} = game) do
    new_paragraph =
      paragraph
      |> String.to_charlist()
      |> Enum.with_index(1)
      |> Enum.map(fn {char, index} ->
        replace_character(index in current, char)
      end)
      |> List.to_string()

    %{game | plan: plan, paragraph: new_paragraph}
  end

  def replace_character(true, _char), do: '_'
  def replace_character(false, char), do: char
end
