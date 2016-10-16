defmodule CowboyRestExample.Defaults do
  defmacro __using__(_) do
    quote do
      @behaviour CowboyRestExample.DefaultBehaviour

      alias CowboyRestExample.Repo

      def init(_protocol, _request, _options), do: {:upgrade, :protocol, :cowboy_rest}

      def rest_init(request, _options), do: {:ok, request, %{}}

      def content_types_provided(request, state) do
        {[{"application/json", :to_json}], request, state}
      end

      def is_authorized(request, state) do
        {auth_header, request} = :cowboy_req.header("authorization", request)
        case auth_header do
          :undefined -> {{false, "Basic"}, request, state}
          _ -> {true, request, Map.put(state, :rights, "Everything")}
        end
      end

      def forbidden(request, state), do: {true, request, state}

      defoverridable [forbidden: 2]
    end
  end
end

defmodule CowboyRestExample.DefaultBehaviour do
  @callback to_json(Tuple.t, Tuple.t) :: Tuple.t
end
