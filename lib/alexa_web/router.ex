defmodule AlexaWeb.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn |> send_resp(200, "AlexaWeb")
  end

  post "/command" do
    {:ok, body, conn} = read_body(conn)
    request = Poison.decode!(body, as: %Alexa.Request{})
    response = Alexa.handle_request(request)
    conn = send_resp(conn, 200, Poison.encode!(response))
    conn = %{conn | resp_headers: [{"content-type", "application/json"}]}
    conn
  end

  match _ do
    send_resp(conn, 404, "AlexaWeb: 404 - Page not found")
  end

end
