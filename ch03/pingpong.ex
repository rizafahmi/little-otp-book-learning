defmodule PingPong do
  defmodule Ping do
    def loop do
      receive do
        {sender_pid, :ping} ->
          send(sender_pid, {self, :pong})
          IO.puts "PONG"
          loop
      end
    end
  end

  defmodule Pong do
    def loop do
      receive do
        {sender_pid, :pong} ->
          send(sender_pid, {self, :ping})
          IO.puts "PING"
          loop
      end
    end
  end

end
