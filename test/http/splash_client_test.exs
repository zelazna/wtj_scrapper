defmodule HTTP.SplashClientTest do
  use ExUnit.Case, async: true
  import Mimic

  setup :verify_on_exit!

  setup do
    stub(:hackney)
    :ok
  end

  test "request body" do
    expect(:hackney, :request, fn :get,
                                  "http://localhost:8050/render.html?foo=bar",
                                  [],
                                  "",
                                  [recv_timeout: 10000] ->
      {:ok, 200, "headers", :client}
    end)

    expect(:hackney, :body, fn _, _ -> {:ok, "response"} end)

    assert HTTP.SplashClient.get!("http://localhost:8050/render.html", [], params: %{foo: "bar"}) ==
             %HTTPoison.Response{
               status_code: 200,
               headers: "headers",
               body: "response",
               request_url: "http://localhost:8050/render.html?foo=bar",
               request: %HTTPoison.Request{
                 body: "",
                 headers: [],
                 method: :get,
                 options: [params: %{foo: "bar"}, recv_timeout: 10000],
                 params: %{foo: "bar"},
                 url: "http://localhost:8050/render.html?foo=bar"
               }
             }
  end
end
