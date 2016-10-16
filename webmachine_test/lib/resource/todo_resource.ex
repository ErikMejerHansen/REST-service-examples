defmodule WebmachineTest.TodoResource do
  alias WebmachineTest.Repo

  def init(_), do: {:ok, nil}
  def ping(req_data, _state), do: {:pong, req_data, %{}}

  def allowed_methods(req_data, state) do
    {[:POST, :GET], req_data, state}
  end

  def content_types_provided(req_data, state) do
    {[{'application/json', :to_json}, {'text/html', :to_html}], req_data, state}
  end

  def resource_exists(req_data, state) do
    case :wrq.method(req_data) do
      :POST -> {false, req_data, state}
      _ ->
        todos =
          Repo.all(WebmachineTest.Todo)
          |> Enum.map(&(%{
              todo: &1.subject,
              created: &1.inserted_at
              }))

        {true, req_data, Map.put(state, :todos, todos)}
    end
  end

  def content_types_accepted(req_data, state) do
   {[{'application/json', :from_json}], req_data, state}
  end

  def from_json(req_data, state) do
    updater = &(Map.merge(%WebmachineTest.Todo{}, &1))

    todo =
      :wrq.req_body(req_data)
      |> Poison.decode!()
      |> updater.()
      |> Repo.insert!()

    state = Map.put(state, :todo, todo)
    {true, req_data, state}
  end

  def post_is_create(req_data, state) do
    {true, req_data, state}
  end

  def create_path(req_data, state) do
    {'/todo/', req_data, state}
  end

  def allow_missing_post(req_data, state) do
   {true, req_data, state}
  end

  def to_json(req_data, state) do
    reply = Poison.encode!(state.todos)

    {reply, req_data, state}
  end
end
