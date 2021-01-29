defmodule Memz.Library.Passage.Query do
  import Ecto.Query
  alias Memz.Library.Passage

  def all() do
    Passage
  end

  def find_by_name(query, name) do
    from(p in query, where: p.name == ^name, limit: 1)
  end

  def select_name(query) do
    from(p in query, select: p.name)
  end

  def order_by_id(query) do
    from(p in query, order_by: p.id)
  end
end
