defmodule MemzWeb.GameLive do
  use MemzWeb, :live_view
  alias Memz.Game
  alias Memz.Library

  def mount(%{"name" => name}, _session, socket) do
    passage = Library.find_passage_by_name(name)
    socket = assign(socket, passage: passage)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1> Welcome</h1>
    <%= live_component @socket, MemzWeb.EraserComponent,
                      id: "game", passage: @passage %>
    """
  end
end
