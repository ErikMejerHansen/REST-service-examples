defmodule PhoenixRestExample.TodoController do
  use PhoenixRestExample.Web, :controller

  def list(conn, _) do
    render(conn, "list.json", %{todos: Repo.all(PhoenixRestExample.Todo)})
  end

  def get(conn, %{"id" => id}) do
    todo = Repo.get(PhoenixRestExample.Todo, id)

    render(conn, "get.json", %{todo: todo})
  end

  def create(conn, %{"subject" => todo}) do
    Repo.insert!(%PhoenixRestExample.Todo{subject: todo})

    conn
    |> put_resp_header("location", "todo")
    |> send_resp(201, "")
  end

end
