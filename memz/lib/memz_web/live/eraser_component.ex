defmodule MemzWeb.EraserComponent do
  use Phoenix.LiveComponent
  alias Memz.Game

  def mount(socket) do
    steps_total = 4
    paragraph = "Did your try turning it off and on again?"

    {:ok,
     assign(socket,
       game: Game.new(steps_total, paragraph)
     )}
  end

  def render(assigns) do
    ~L"""
    <pre><%= @game.paragraph %></pre>
    <h2>
     Memorize text in <%= @game.steps_total %> steps
    </h2>
    <button phx-click="erase" phx-target="<%= @myself %>">

      Erase
    </button>
    """
  end

  def handle_event("erase", _, socket) do
    {:noreply, erase(socket)}
  end

  defp erase(socket) do
    socket
    |> assign(game: Game.erase(socket.assigns.game))
  end
end
