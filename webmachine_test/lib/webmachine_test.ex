defmodule WebmachineTest do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    #Config from http://seancribbs.com/tech/2016/07/07/webmachine-elixir-tutorial-1/
    web_config = [ip: {192, 168, 1, 73},
                  port: 8000,
                  dispatch: [
                    {[], WebmachineTest.Hello, []},
                    {['todo'], WebmachineTest.TodoResource, []},
                    {['todo', :id], WebmachineTest.SingleTodoResource, []}
                    ]]

    # Define workers and child supervisors to be supervised
    children = [
      worker(:webmachine_mochiweb, [web_config],
             function: :start,
             modules: [:mochiweb_socket_server]),
      supervisor(WebmachineTest.Repo, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebmachineTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
