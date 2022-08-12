defmodule Loop do

  defmacro while(expression, do: block) do
    quote do
      try do
        for _ <- Stream.cycle([:ok]) do
          if unquote(expression) do
            unquote(block)
          else
            Loop.break
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  def break, do: throw :break
end

# Stream.cycle/1
# Creates a stream that cycles through the given enumerable, infinitely.
#
# Example
# iex> stream = Stream.cycle([1, 2, 3])
# iex> Enum.take(stream, 5)
# [1, 2, 3, 1, 2]

# Test function
# iex> c "while.exs"
#
# iex> import Loop
#
# iex>
# pid = spawn ->
#   while true do
#     receive do
#       :stop ->
#         IO.puts "Stopping..."
#         break
#       message ->
#         IO.puts "Got #{inspect message}"
#     end
#   end
# end
#
# iex> send pid, :hello
# iex> send pid, :ping
# iex> send pid, :stop
# iex> Process.alive? pid
