defmodule PhoenixRestExample.Todo do
    use Ecto.Schema

    import Ecto
    import Ecto.Changeset
    import Ecto.Query, only: [from: 1, from: 2, where: 3]

    schema "todos" do
      field :subject, :string

      timestamps
    end
end
