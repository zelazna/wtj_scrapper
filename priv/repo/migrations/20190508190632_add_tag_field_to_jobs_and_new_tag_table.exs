defmodule WtjScrapper.Repo.Migrations.AddTagFieldToJobsAndNewTagTable do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add(:name, :string)
    end

    alter table(:jobs) do
      add(:tag_id, references(:tags))
    end

    create(unique_index(:jobs, [:url]))
    create(unique_index(:tags, [:name]))
  end
end
