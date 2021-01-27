defmodule MemzWeb.CounterLive do
  use MemzWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0, message: "Let the count begin")}
  end

  def render(assigns) do
    ~L"""
    <h1><%= @message %></h1>
    <h2>
      <button phx-click="inc">
        Increment
      </button>
      <%= @count %>
    </h2>
    """
  end

  def handle_event("inc", _, socket) do
    {:noreply, inc(socket)}
  end

  def inc(socket) do
    assign(socket, count: socket.assigns.count + 1)
  end
end
