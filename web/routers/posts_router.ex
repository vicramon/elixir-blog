defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn = conn.assign(:title, "Elixir Blog")
  end

  get "/" do
    render conn, "index.html", posts: PostQueries.all
  end

  get "/:post_id" do
    { id, _ } = String.to_integer(post_id)
    render_post(conn, PostQueries.find_by_id(id))
  end

  def render_post(conn, post) when post == nil, do: render(conn, "404.html")

  def render_post(conn, post), do: render(conn, "post.html", post: post)

end
