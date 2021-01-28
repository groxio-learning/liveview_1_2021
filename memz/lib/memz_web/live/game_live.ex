defmodule MemzWeb.GameLive do
  use MemzWeb, :live_view
  alias Memz.Game

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1> Welcome</h1>
    <%= live_component @socket, MemzWeb.EraserComponent, id: "game" %>
    """
  end
end
