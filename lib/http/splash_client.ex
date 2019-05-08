defmodule WtjScrapper.HTTP.SplashClient do
  use HTTPoison.Base

  @path_map %{
    "timeout" => 10,
    "wait" => 5,
    "User-Agent" =>
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36"
  }

  def process_request_options(options), do: options ++ [recv_timeout: 10000]

  def process_request_url(url) do
    Application.get_env(:wtj_scrapper, :splash_url) <> handle_path(url)
  end

  defp handle_path(url) do
    Map.merge(@path_map, %{url: url})
    |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
    |> Enum.join("&")
    |> URI.encode()
  end
end
