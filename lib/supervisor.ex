defmodule Chat.Supervisor do
  use Supervisor

  alias Chat.Server

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Chat.Server, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
