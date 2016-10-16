use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :phoenix_rest_example, PhoenixRestExample.Endpoint,
  secret_key_base: "+USXTzY/jVj9YpTU1jWSXMaDWV9acFSiqML829nzI5DIebHNmuIgcRTh49kwoNwH"

# Configure your database
config :phoenix_rest_example, PhoenixRestExample.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "phoenix_rest_example_prod",
  pool_size: 20
