# Notes: 27.01.2021

## Lesson 1: Constructor, Reducer, Converter

```
# constructor 
"turtle"
# function (converter) takes something and returns something else
to_string 
# reducer
# input |> constructor |> reducer (handlers)         |> converter
:turtle |> to_string   |> Kernel.<>(", mutant ninja") |> String.length
```

## get info (i)
```
[{:one, 1}, {:two, 2}]
> [one: 1, two: 2]
# info on last thing in iex
i

# use tab to see options in iex
[{:one, 1}, {:two, 2}] |> Map.<tab>

# input |> constructor
[{:one, 1}, {:two, 2}] |> Map.new
> %{one: 1, two: 2}
```

## add to: Map.put
```
# input              |> constructor |> reducer      |> converter (to enumerable)
[{:one, 1}, {:two, 2}] |> Map.new |> Map.put(:three, 3) |> Map.to_list
```

## new phoenix live project (memory)
```
mix phx.new memz --live 
cd memz

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
cd assets
npm install
cd ..
```
