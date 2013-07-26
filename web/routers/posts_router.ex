defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn = conn.assign(:title, "Elixir Posts")
  end

  get "/" do
    render conn, "index.html", posts: PostQueries.all
  end

  get "/:post_id" do
    { id, _ } = String.to_integer(post_id)
    render conn, "post.html", post: PostQueries.find_by_id(id)
  end
end
