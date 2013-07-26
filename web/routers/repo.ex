alias Ecto.Adapters.Postgres

defmodule MyRepo do
  use Ecto.Repo, adapter: Postgres

  def url, do: "ecto://blogger@localhost/blog"
end

{ :ok, _pid } = Postgres.start(MyRepo)
