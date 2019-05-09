defmodule HTTP.SplashClient do
  use HTTPoison.Base
  def process_request_options(options), do: options ++ [recv_timeout: 10000]
end
