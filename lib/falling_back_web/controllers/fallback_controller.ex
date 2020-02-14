defmodule FallingBackWeb.FallbackController do
  use FallingBackWeb, :controller

  def call(conn, _) do
    conn
      |> text("hello")
  end

end