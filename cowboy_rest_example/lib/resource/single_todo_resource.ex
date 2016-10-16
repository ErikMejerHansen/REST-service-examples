defmodule CowboyRestExample.SingleTodoResource do
  use CowboyRestExample.Defaults

  def allowed_methods(request, state) do
      {["GET", "HEAD", "OPTIONS"], request, state}
  end

  def resource_exists(request, state) do
    {id, request} = :cowboy_req.binding(:id, request)
    IO.inspect(id)
    case Repo.get(CowboyRestExample.Todo, String.to_integer(id)) do
      nil -> {false, request, state}
      todo ->
        {true, request, Map.put(state, :todo, todo)}
    end
  end

  def to_json(request, state) do
    todo = Poison.encode!(%{
              todo: state.todo.subject,
              created: state.todo.inserted_at
              })

    {todo, request, state}
  end

  def forbidden(request, %{rights: "Everything"} = state), do: {false, request, state}
  def forbidden(request, state), do: {true, request, state}

end
