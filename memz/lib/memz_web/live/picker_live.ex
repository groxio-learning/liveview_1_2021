defmodule MemzWeb.PickerLive do
  use MemzWeb, :live_view

  alias Memz.Library

  @passage_names ["it_crowd", "ghandi", "star_treck", "terminator", "moana", "bible"]

  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> start_from_beginning()
      |> passage_lookup()
    }
  end

  def render(assigns) do
    ~L"""
    <h1> Welcome</h1>
    <h2><%= @current_name %></h2>
    <button phx-click="next">
      Next Passage
    </button>
    """
  end

  def handle_event("next", _, socket) do
    {
      :noreply,
      socket
      |> next_passage()
      |> passage_lookup()
    }
  end

  defp next_passage(socket) do
    case socket.assigns.passage_names do
      [] ->
        start_from_beginning(socket)
      [current_name | rest] ->
        assign(socket, current_name: current_name, passage_names: rest)
    end
  end

  defp passage_lookup(socket) do
    passage = Library.find_passage_by_name(socket.assigns.current_name)
    assign(socket, passage: passage)
  end

  defp start_from_beginning(socket) do
    passage_names = @passage_names
    [first | rest] = passage_names
    assign(socket,
              current_name: first,
              passage_names: rest,
              all: passage_names
            )
  end
end
