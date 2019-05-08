defmodule WtjScrapper.Models.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field(:name, :string)
    has_many(:jobs, WtjScrapper.Models.Job)
    timestamps()
  end

  def changeset(tag, params \\ %{}) do
    tag
    |> cast(params, [:name])
    |> update_change(:name, &String.downcase/1)
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
