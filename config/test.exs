use Mix.Config

config :wtj_scrapper, WtjScrapper.Repo,
  database: "wtj_scrapper_repo_test",
  username: "constantinguidon",
  password: "pass",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wtj_scrapper, ecto_repos: [WtjScrapper.Repo]

config :wtj_scrapper,
  wtj_url: "https://www.welcometothejungle.co",
  splash_url: "http://localhost:8050/render.html?"
