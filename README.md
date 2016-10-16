# Simple REST service in Cowboy_rest, webmachine and Phoenix

Simple Todo REST service implemented in cowboy_rest, webmachine and Phoenix.
Contains the sample code to go with this [blog post](http://erikmejerhansen.github.io/2016/10/16/REST-services-in-Elixir-with-Cowboy.html).

## Bootstrapping the database
The Todo REST services relies on a MySql database that can be boostrapped in the `cowboy_rest_example` project with
`mix ecto.setup`.
