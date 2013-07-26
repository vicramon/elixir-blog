alias Ecto.Adapters.Postgres

defmodule MyRepo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url, do: "ecto://blogger@localhost/blog"
end

defmodule Post do
  use Ecto.Entity

  dataset :posts do
    field :title, :string
    field :content, :string
  end

end

defmodule PostQueries do
  import Ecto.Query

  def all, do: Enum.map(_all, fn(x) -> {x.title, x.content} end)
  
  defp _all, do: MyRepo.all(from p in Post)
end

{ :ok, _pid } = Postgres.start(MyRepo)

defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
  end

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html", posts: PostQueries.all
  end
end
