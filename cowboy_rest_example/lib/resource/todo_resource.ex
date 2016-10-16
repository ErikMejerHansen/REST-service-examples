defmodule CowboyRestExample.TodoResource do
  use CowboyRestExample.Defaults

  def allowed_methods(request, state) do
      {["GET", "HEAD", "OPTIONS", "POST"], request, state}
  end

  def resource_exists(request, state) do
    {method, request} = :cowboy_req.method(request)
    todos = Repo.all(CowboyRestExample.Todo)

    case {method, todos} do
      {"POST", _} -> {false, request, state}
      {_, nil} -> {false, request, state}
      {_, todos} -> {true, request, Map.put(state, :todos, todos)}
    end
  end

  def content_types_accepted(request, state) do
      {[{"application/json", :from_json}], request, state}
  end

  def from_json(request, state) do
    {:ok, body, request} = :cowboy_req.body(request)

    todo = Poison.decode!(body)
    todo = Repo.insert!(%CowboyRestExample.Todo{subject: todo["todo"]})

    {host, request} = :cowboy_req.host(request)

    {{true, "#{host}/todo/#{todo.id}"}, request, state}
  end

  def to_json(request, state) do
    todos = state.todos
    |> Enum.map(&(%{
              todo: &1.subject,
              created: &1.inserted_at
              }))
    |> Poison.encode!()

    {todos, request, state}
  end

  def forbidden(request, %{rights: "Everything"} = state), do: {false, request, state}
  def forbidden(request, state), do: {true, request, state}
end
