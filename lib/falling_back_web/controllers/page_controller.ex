defmodule FallingBackWeb.PageController do
  use FallingBackWeb, :controller
  plug :monitor_crashes
  action_fallback FallingBackWeb.FallbackController

  def index(conn, _params) do
    spawn_link fn -> raise "oops" end
    render(conn, "index.html")
  end

  defp monitor_crashes(conn, _) do
    {:ok, _pid} = CrashesMonitor.start_link(conn)
    conn
  end

end
