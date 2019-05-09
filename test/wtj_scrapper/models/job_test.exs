defmodule WtjScrapper.Models.JobTest do
  use ExUnit.Case, async: true
  alias WtjScrapper.Models.{Job, Tag}

  test "url is required" do
    changeset = Job.changeset(%Job{}, %{})
    refute changeset.valid?
  end

  test "url is unique" do
    {:ok, tag} = WtjScrapper.Repo.insert(%Tag{name: "ruby"})

    WtjScrapper.Repo.insert(%Job{
      url: "http://google.com",
      content: "aze",
      title: "title",
      tag_id: tag.id
    })

    {:error, changeset} = WtjScrapper.Repo.insert(Job.changeset(%Job{}, %{name: "python"}))
    refute changeset.valid?
  end
end
