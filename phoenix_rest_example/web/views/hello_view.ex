defmodule PhoenixRestExample.HelloView do
  use PhoenixRestExample.Web, :view
  def render("hello.json", info) do
    %{hello: info[:hello]}
  end
end
