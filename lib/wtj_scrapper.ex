defmodule WtjScrapper do
  @moduledoc """
  Documentation for WtjScrapper.
  """

  alias WtjScrapper.{Parser, Repo}
  alias WtjScrapper.Models.Tag

  def run(tags) when is_list(tags) do
    Enum.map(tags, &run/1)
  end

  def run(tag_name) when is_binary(tag_name) do
    HTTPoison.start()

    changeset = Tag.changeset(%Tag{}, %{name: tag_name})

    tag =
      case Repo.insert(changeset) do
        {:error, _changeset} -> Repo.get_by(Tag, name: tag_name)
        {:ok, tag} -> tag
      end

    HTTPoison.get!(
      Application.get_env(:wtj_scrapper, :splash_url),
      [],
      params: %{
        url: Application.get_env(:wtj_scrapper, :wtj_url) <> "/fr/jobs?query=#{tag_name}",
        timeout: 10,
        wait: 5,
        "User-Agent": Application.get_env(:wtj_scrapper, :user_agent)
      },
      recv_timeout: 10000
    ).body
    |> Parser.get_links()
    |> Enum.map(&Task.async(WtjScrapper.JobHandler, :get_job, [&1, tag]))
    |> Enum.map(&Task.await(&1))
  end
end
