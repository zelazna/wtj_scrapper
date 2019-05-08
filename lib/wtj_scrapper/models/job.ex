defmodule WtjScrapper.Models.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field(:url, :string, unique: true)
    field(:title, :string)
    field(:content, :string)
    belongs_to(:tag, WtjScrapper.Models.Tag)
    timestamps()
  end

  def changeset(job, params \\ %{}) do
    job
    |> cast(params, [:url, :title, :content, :tag_id])
    |> validate_required([:url, :title, :content, :tag_id])
    |> foreign_key_constraint(:tag_id)
    |> unique_constraint(:url)
  end
end
