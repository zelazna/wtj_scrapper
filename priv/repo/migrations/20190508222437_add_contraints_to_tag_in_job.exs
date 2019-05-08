defmodule WtjScrapper.Repo.Migrations.AddContraintsToTagInJob do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      remove(:tag_id)
      add(:tag_id, references(:tags), null: false)
    end
  end
end
