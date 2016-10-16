defmodule CowboyRestExample.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :subject, :string, size: 2048

      timestamps
    end
  end
end
