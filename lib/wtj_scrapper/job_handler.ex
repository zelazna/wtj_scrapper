defmodule WtjScrapper.JobHandler do
  alias WtjScrapper.Models.Job

  def get_job(job_path, tag) do
    HTTPoison.get!(
      Application.get_env(:wtj_scrapper, :wtj_url) <> job_path,
      [],
      ssl: [{:versions, [:"tlsv1.2"]}]
    )
    |> unserialize_job
    |> save_job(tag)
  end

  defp unserialize_job(response) do
    job_map = %{content: nil, tag_id: nil, title: nil, url: nil}
    {_html, job} = WtjScrapper.Parser.parse_job(response.body, job_map)
    %{job | url: response.request_url}
  end

  defp save_job(job, tag) do
    Job.changeset(%Job{}, %{job | tag_id: tag.id})
    |> WtjScrapper.Repo.insert()
  end
end
