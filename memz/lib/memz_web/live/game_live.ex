defmodule MemzWeb.GameLive do
  use MemzWeb, :live_view
  alias Memz.Game

  def mount(_params, _session, socket) do
    steps_total = 4
    paragraph = "Did your try turning it off and on again?"
    {:ok, assign(socket, game: Game.new(steps_total, paragraph))}
  end

  def render(assigns) do
    ~L"""
    <h1><%= @game.paragraph %></h1>
    <h2>
      <%= @game.steps_total %>
    </h2>
    <button phx-click="erase">
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
