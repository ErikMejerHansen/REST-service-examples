defmodule CowboyRestExample.Hello do
  def init(_protocol, _request, _options), do: {:upgrade, :protocol, :cowboy_rest}

  def content_types_provided(request, state) do
    {[{"text/html", :to_html},
    {"application/json", :to_json}], request, state}
  end

  def to_html(request, state), do: {"<h1>Hello, World</h1>", request, state}
  def to_json(request, state), do: {Poison.encode!(%{hello: "world"}), request, state}
end
