defmodule PhoenixRestExample.HelloController do
  use PhoenixRestExample.Web, :controller

  def show(conn, _) do
    render(conn, "hello.json", %{hello: "world"})
  end

end
