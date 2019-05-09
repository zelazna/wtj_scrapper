defmodule WtjScrapper.Models.TagTest do
  use ExUnit.Case, async: true
  alias WtjScrapper.Models.Tag

  test "name is required" do
    changeset = Tag.changeset(%Tag{}, %{})
    refute changeset.valid?
  end

  test "name is downcased" do
    changeset = Tag.changeset(%Tag{}, %{name: "PythoN"})
    assert changeset.valid?
    assert changeset.changes.name == "python"
  end

  test "name is unique" do
    WtjScrapper.Repo.insert(%Tag{name: "python"})
    {:error, changeset} = WtjScrapper.Repo.insert(Tag.changeset(%Tag{}, %{name: "python"}))
    refute changeset.valid?
  end
end
