defmodule WtjScrapper.Parser do
  def parse_job(html, job) do
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
      |> Enum.map(&Floki.text(&1, sep: "\n"))
      |> Enum.join("\n")

    {html, %{job | content: content}}
  end

  defp get_job_title({html, job}) do
    title =
      html
      |> Floki.find("h1")
      |> Floki.text()

    {html, %{job | title: title}}
  end
end
