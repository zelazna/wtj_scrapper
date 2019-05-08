defmodule WtjScrapper.HTTP.WtjClient do
  use HTTPoison.Base

  def process_request_options(options), do: options ++ [ssl: [{:versions, [:"tlsv1.2"]}]]

  def process_request_url(path), do: Application.get_env(:wtj_scrapper, :wtj_url) <> path
end
