defmodule CrashesMonitor do
  use GenServer

  def start_link(conn) do
    GenServer.start_link(__MODULE__, conn)
  end

  @impl true
  def init(conn) do
    Process.flag(:trap_exit, true)
    {:ok, %{conn: conn}}
  end

  @impl true
  def terminate(:normal, _), do: :ok
  def terminate(reason, state) do
    IO.inspect "Web request handler crashed! Here's the conn I remember:"
    IO.inspect(state.conn)

    IO.inspect "And the reason for exit:"
    IO.inspect(reason)
  end
end