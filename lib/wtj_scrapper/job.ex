defmodule WtjScrapper.Job do
  use Ecto.Schema

  schema "jobs" do
    field(:url, :string)
    field(:title, :string)
    field(:content, :string)
    timestamps()
  end

  # @TODO unique on url with changeset
end
