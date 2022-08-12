# Metaprogramming

## Concepts

`quote`: return the AST representation of an expression.
`unquote`: allows values to be injected into an AST that is being defined.
`macros`: are code that write code.

All Elixir code is represented as a series of three-element tuples with the following format:
- The first element is an atom denoting the function call, or another tuple, representing a nested node in AST
- The second element represents metadata about the expression.
- The third element is a list of arguments for the function call.

Example: 
```
  quote do: 5 + 2
  {:+, [context: Elixir, import: Kernel], [5, 2]}
```

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `metaprogramming` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:metaprogramming, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/metaprogramming](https://hexdocs.pm/metaprogramming).

