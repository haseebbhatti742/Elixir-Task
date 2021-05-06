defmodule ElixirTaskWeb.PageController do
  use ElixirTaskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
