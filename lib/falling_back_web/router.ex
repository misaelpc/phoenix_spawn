defmodule FallingBackWeb.Router do
  use FallingBackWeb, :router
  use Plug.ErrorHandler

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FallingBackWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Something went wrong")
  end

  # Other scopes may use custom stacks.
  # scope "/api", FallingBackWeb do
  #   pipe_through :api
  # end
end
