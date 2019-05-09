defmodule WtjScrapper.TestJobHandler do
  use ExUnit.Case, async: false

  import Mock
  alias WtjScrapper.{Repo, JobHandler}
  alias WtjScrapper.Models.Tag

  setup_all do
    tag = %Tag{name: "elixir"}
    Repo.insert(tag)
    :ok
  end

  test "get_job create a new job entry in the DB" do
    {:ok, file} = File.read("test/ressources/job.html")

    with_mock HTTPoison, get!: fn url, _, _ -> %{body: file, request_url: url} end do
      tag = Repo.get_by(Tag, name: "elixir")
      {:ok, result} = JobHandler.get_job("/path", tag)
      assert result.url == "https://www.welcometothejungle.co/path"
      assert result.title == "Python Software Engineer // Computer Vision   "
      assert result.tag_id == tag.id
    end
  end
end
