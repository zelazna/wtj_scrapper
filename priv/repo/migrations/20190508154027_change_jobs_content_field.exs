defmodule WtjScrapper.Repo.Migrations.ChangeJobsContentField do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      modify(:content, :text)
    end
  end
end
