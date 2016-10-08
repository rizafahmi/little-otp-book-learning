require IEx
defmodule Cache do
  use GenServer

  @name CACHE

  # Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: @name])
  end
  def write(key, value) do
    GenServer.call(@name, {:write, key, value})
  end

  def read(key) do
    IEx.pry
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.call(@name, {:delete, key})
  end

  def clear do
    GenServer.cast(@name, :clear)
  end

  def exist?(key) do
    GenServer.call(@name, {:exist, key})
  end

  def stop do
    GenServer.cast(@name, :stop)
  end

  # Server Callback
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, key, value}, _from, stats) do
    {:reply, :ok, Map.put(stats, key, value)}
  end

  def handle_call({:read, key}, _from, stats) do
    {:reply, stats[key], stats}
  end

  def handle_call({:delete, key}, _from, stats) do
    {:reply, :ok, Map.delete(stats, key)}
  end

  def handle_cast(:clear, _stats) do
    {:noreply, %{}}
  end

  def handle_call({:exist, key}, _from, stats) do
    {:reply, Map.has_key?(stats, key), stats}
  end

  def handle_cast({:stop}, stats) do
    {:stop, :normal, stats}
  end

  def terminate(reason, stats) do
    IO.puts "Server terminated because of #{inspect reason}"
    IO.puts inspect stats
    :ok
  end

  def handle_info(msg, stats) do
    IO.puts "Receiving #{inspect msg}. Don't know what to do"
    {:noreply, stats}
  end

  # Helpers Function
end
