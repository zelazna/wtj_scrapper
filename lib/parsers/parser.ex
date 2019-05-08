defmodule WtjScrapper.Parser do
  alias WtjScrapper.Job

  def parse_job(html, %Job{} = job) do
    get_job_content({html, job})
    |> get_job_title()
  end

  def get_links(html) do
    html
    |> Floki.find(".ais-Hits-item article a")
    |> Floki.attribute("href")
  end

  defp get_job_content({html, job}) do
    content =
      html
      |> Floki.find("main section:nth-child(4) section")
      |> Enum.map(&Floki.text/1)
      |> Enum.join("\n")

    {html, %Job{job | content: content}}
  end

  defp get_job_title({html, job}) do
    title =
      html
      |> Floki.find("h1")
      |> Floki.text()

    {html, %Job{job | title: title}}
  end
end
