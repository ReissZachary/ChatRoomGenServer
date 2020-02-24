defmodule Chat.Server do
  use GenServer

  #client side
  def start_link do
    GenServer.start_link(__MODULE__, [], name: :chat_room)
  end

  def get_messages do
    GenServer.call(:chat_room, :get_messages)
  end

  def add_messages(message) do
    GenServer.cast(:chat_room, {:add_message, message})
  end

  #server side
  def init(messages) do
    {:ok, messages}
  end

  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end

  def handle_cast({:add_message, message}, messages) do
    {:noreply, [message | messages]}
  end


end
