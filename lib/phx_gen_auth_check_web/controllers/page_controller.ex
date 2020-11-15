defmodule PhxGenAuthCheckWeb.PageController do
  use PhxGenAuthCheckWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
