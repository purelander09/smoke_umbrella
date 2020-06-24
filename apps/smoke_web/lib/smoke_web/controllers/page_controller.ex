defmodule SmokeWeb.PageController do
  use SmokeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
