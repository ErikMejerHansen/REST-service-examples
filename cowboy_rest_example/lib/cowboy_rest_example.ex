defmodule CowboyRestExample do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(CowboyRestExample.Repo, []),
    ]

    #Dispatcher ~ router
    dispatch = CowboyRestExample.Dispatch.dispatch()
    {:ok, _} = :cowboy.start_http(:http, 100,
                                  [port: 8000],
                                  [
                                    env: [dispatch: dispatch]
                                  ])



    opts = [strategy: :one_for_one, name: CowboyRestExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
