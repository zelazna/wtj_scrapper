defmodule WtjScrapper.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add(:url, :string)
      add(:title, :string)
      add(:content, :string)
      timestamps()
    end
  end
end
