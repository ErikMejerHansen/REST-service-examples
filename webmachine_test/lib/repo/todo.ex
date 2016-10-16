defmodule WebmachineTest.Todo do
    schema "todos" do
      field :subject, :string

      timestamps
    end
end
