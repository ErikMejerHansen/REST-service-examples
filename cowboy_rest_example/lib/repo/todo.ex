defmodule CowboyRestExample.Todo do
    use Ecto.Schema

    schema "todos" do
      field :subject, :string

      timestamps
    end
end
