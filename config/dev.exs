use Mix.Config

config :wtj_scrapper, WtjScrapper.Repo,
  database: "wtj_scrapper_repo",
  username: "constantinguidon",
  password: "pass",
  hostname: "localhost"

config :wtj_scrapper,
  wtj_url: "https://www.welcometothejungle.co",
  splash_url: "http://localhost:8050/render.html?"
