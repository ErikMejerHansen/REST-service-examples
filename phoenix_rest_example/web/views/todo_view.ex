defmodule PhoenixRestExample.TodoView do
  use PhoenixRestExample.Web, :view
  def render("list.json", info) do
    info[:todos]
    |> Enum.map(&(%{
              todo: &1.subject,
              created: &1.inserted_at
              }))
  end

  def render("get.json", info) do
    %{
      todo: info.todo.subject,
      created: info.todo.inserted_at
    }
  end
end
