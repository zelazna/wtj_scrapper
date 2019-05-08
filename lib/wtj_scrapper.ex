defmodule WtjScrapper do
  @moduledoc """
  Documentation for WtjScrapper.
  """
  alias WtjScrapper.Parser
  alias WtjScrapper.Job
  alias WtjScrapper.HTTP.SplashClient
  alias WtjScrapper.HTTP.WtjClient

  def run() do
    SplashClient.start()
    WtjClient.start()

    SplashClient.get!(Application.get_env(:wtj_scrapper, :wtj_url) <> "/fr/jobs?query=python").body
    |> Parser.get_links()
    |> Enum.map(&WtjClient.get!(&1, sep: " "))
    |> Enum.map(&unserialize_job/1)
    |> Enum.map(&WtjScrapper.Repo.find_or_create/1)
  end

  defp unserialize_job(request) do
    {_html, job} = Parser.parse_job(request.body, %Job{})
    %Job{job | url: request.request_url}
  end
end
