defmodule PhoenixRestExample.Router do
  use PhoenixRestExample.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixRestExample do
    pipe_through :api
    get "/", HelloController, :show
    get "/todo", TodoController, :list
    get "todo/:id", TodoController, :get
    post "/todo", TodoController, :create
  end
end
