defmodule HTTP.WtjClientTest do
  use ExUnit.Case, async: true
  import Mimic

  setup :verify_on_exit!

  setup do
    stub(:hackney)
    :ok
  end

  test "request body" do
    expect(:hackney, :request, fn :get,
                                  "https://www.welcometothejungle.co/path",
                                  [],
                                  "",
                                  [ssl_options: [versions: [:"tlsv1.2"]]] ->
      {:ok, 200, "headers", :client}
    end)

    expect(:hackney, :body, fn _, _ -> {:ok, "response"} end)

    assert HTTP.WtjClient.get!("/path") ==
             %HTTPoison.Response{
               status_code: 200,
               headers: "headers",
               body: "response",
               request_url: "https://www.welcometothejungle.co/path",
               request: %HTTPoison.Request{
                 body: "",
                 headers: [],
                 method: :get,
                 options: [ssl: [{:versions, [:"tlsv1.2"]}]],
                 url: "https://www.welcometothejungle.co/path"
               }
             }
  end
end
