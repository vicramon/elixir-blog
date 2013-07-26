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
    { :ok, post } = Enum.fetch(_find_by_id(id), 0)
    post
  end

  def all, do: Enum.map(_all, fn(x) -> {x.headline, x.content} end)

  defp _all, do: MyRepo.all(from p in Post)
  defp _find_by_id(id), do: MyRepo.all(from p in Post, where: p.id == id)
end
