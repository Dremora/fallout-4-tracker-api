defmodule Fallout_4Tracker.Repo.Migrations.CreateQuest do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add :name, :string
      add :category, :string
      add :status, :string

      timestamps
    end

  end
end
