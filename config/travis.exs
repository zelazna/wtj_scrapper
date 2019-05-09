use Mix.Config

config :wtj_scrapper, WtjScrapper.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "wtj_scrapper_repo_test",
  username: "postgres",
  password: "",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wtj_scrapper,
  wtj_url: "https://www.welcometothejungle.co",
  splash_url: "http://localhost:8050/render.html?"
