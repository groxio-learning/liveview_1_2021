defmodule Memz.Game do
  defstruct steps_total: 4, plan: [], paragraph: ""

  def new(steps, paragraph, options \\ %{}) do
    chunk = ceil(String.length(paragraph) / steps)
    shuffle_fn = options[:shuffle_fn] || &Enum.shuffle/1
    plan =
      1..String.length(paragraph)
      |> shuffle_fn.()
      |> Enum.chunk_every(chunk)

    %__MODULE__{paragraph: paragraph, plan: plan}
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
