defmodule WtjScrapper.Repo do
  import Ecto.Query, only: [from: 2]

  use Ecto.Repo,
    otp_app: :wtj_scrapper,
    adapter: Ecto.Adapters.Postgres

  def find_or_create(job) do
    query =
      from(j in WtjScrapper.Job,
        where: j.url == ^job.url
      )

    one(query) || insert!(job)
  end
end
