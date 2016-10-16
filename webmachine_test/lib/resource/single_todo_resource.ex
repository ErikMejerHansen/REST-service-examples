defmodule WebmachineTest.SingleTodoResource do
  alias WebmachineTest.Repo

  def init(_), do: {:ok, nil}
  def ping(req_data, _state), do: {:pong, req_data, %{}}

  def allowed_methods(req_data, state) do
    {[:GET], req_data, state}
  end

  def content_types_provided(req_data, state) do
    {[{'application/json', :to_json}, {'text/html', :to_html}], req_data, state}
  end

  def resource_exists(req_data, state) do
    [id: id] = :wrq.path_info(req_data)

    case Repo.get(WebmachineTest.Todo, String.to_integer("#{id}")) do
      nil -> {false, req_data, state}
      todo ->
        {true, req_data, Map.put(state, :todo, todo)}
    end
  end

  def to_json(req_data, state) do
    reply = Poison.encode!(%{
          todo: state.todo.subject,
          created: state.todo.inserted_at
        })




    {reply , req_data, state}
  end
end
