defmodule CowboyRestExample.Dispatch do
  def dispatch() do
    # Routes in cowboy are {host, [paths]} tuples
    #The :_ atom causes cowboy_router to match any host.
    :cowboy_router.compile([{:_, routes()}])
  end

  def routes() do
    [
      {"/", CowboyRestExample.Hello, []},
      {"/todo", CowboyRestExample.TodoResource, []},
      {"/todo/:id", CowboyRestExample.SingleTodoResource, []}
    ]
  end
end
