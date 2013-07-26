defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn = conn.assign(:title, "Elixir Posts")
  end

  get "/" do
    render conn, "index.html", posts: PostQueries.all
  end
end
