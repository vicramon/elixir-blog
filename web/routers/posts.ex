defmodule Post do
  use Ecto.Entity

  dataset :posts do
    field :headline, :string
    field :content, :string
  end
end

defmodule PostQueries do
  import Ecto.Query

  def find_by_id(id) do
    _find_by_id(id) |> post
  end

  def post({ :ok, post }),  do: post
  def post(:error), do: nil

  def all, do: Enum.map(_all, fn(x) -> {x.headline, x.content} end)

  defp _all, do: MyRepo.all(from p in Post)

  defp _find_by_id(id), do: MyRepo.all(from p in Post, where: p.id == id) |> Enum.fetch(0)
end
