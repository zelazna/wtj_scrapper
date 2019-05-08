defmodule WtjScrapper do
  @moduledoc """
  Documentation for WtjScrapper.
  """
  alias WtjScrapper.Parser
  alias WtjScrapper.HTTP.SplashClient
  alias WtjScrapper.HTTP.WtjClient
  alias WtjScrapper.Repo
  alias WtjScrapper.Models.Tag
  alias WtjScrapper.Models.Job

  def run(tag_name) do
    SplashClient.start()
    WtjClient.start()

    changeset = Tag.changeset(%Tag{}, %{name: tag_name})

    tag =
      case Repo.insert(changeset) do
        {:error, _changeset} -> Repo.get_by(Tag, name: tag_name)
        {:ok, tag} -> tag
      end

    SplashClient.get!(
      Application.get_env(:wtj_scrapper, :wtj_url) <> "/fr/jobs?query=#{tag_name}"
    ).body
    |> Parser.get_links()
    |> Enum.map(&WtjClient.get!(&1))
    |> Enum.map(&unserialize_job/1)
    |> Enum.map(&save_job(%{&1 | tag_id: tag.id}))
  end

  defp unserialize_job(request) do
    job_map = %{content: nil, tag_id: nil, title: nil, url: nil}
    {_html, job} = Parser.parse_job(request.body, job_map)
    %{job | url: request.request_url}
  end

  defp save_job(job) do
    Job.changeset(%Job{}, job)
    |> Repo.insert()
  end
end
