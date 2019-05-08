defmodule WtjScrapper.Repo do
  use Ecto.Repo,
    otp_app: :wtj_scrapper,
    adapter: Ecto.Adapters.Postgres
end
