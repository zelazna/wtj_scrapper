Ecto.Adapters.SQL.Sandbox.mode(WtjScrapper.Repo, {:shared, self()})
Application.ensure_all_started(:mimic)
Mimic.copy(:hackney)
ExUnit.start(exclude: [:pending])
