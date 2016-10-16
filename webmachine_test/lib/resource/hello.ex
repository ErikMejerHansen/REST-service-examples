defmodule WebmachineTest.Hello do
  def init(_) do
    {:ok, nil}
  end

  def ping(req_data, _state) do
    {:pong, req_data, %{}}
  end

  def allowed_methods(req_data, state), do: {[:GET, :HEAD, :OPTIONS] ,req_data, state}

  def content_types_provided(req_data, state) do
    {[{'application/json', :to_json}, {'text/html', :to_html}], req_data, state}
  end

  def to_json(req_data, state), do: {Poison.encode!(%{hello: "world"}), req_data, state}

  def is_authorized(req_data, state) do
    {true, req_data, state}
  end

  def forbidden(req_data, state) do
    {false, req_data, state}
  end
end
