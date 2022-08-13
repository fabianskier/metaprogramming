defmodule Debugger do

  defmacro log(expression) do
    if Application.get_env(:debuger, :log_level) == :debug do
      quote bind_quoted: [expression: expression] do
        IO.puts "=================="
        IO.inspect expression
        IO.puts "=================="
        expression
      end
    else
      expression
    end
  end
end

defmodule MyDebugger do
  require Debugger

  Application.put_env(:debugger, :log_level, :debug)
  remote_api_call = fn -> IO.puts("calling remote API...") end
  Debugger.log(remote_api_call.())
end
