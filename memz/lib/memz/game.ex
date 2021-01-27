defmodule Memz.Game do
  defstruct [steps_total: 4, plan: [], paragraph: ""]

  def new(steps, paragraph) do
    chunk = ceil(String.length(paragraph) / steps)
    plan = 1..String.length(paragraph)
          |> Enum.shuffle
          |> Enum.chunk_every(chunk)
    %__MODULE__(paragraph: paragraph, plan: plan)
  end

end
