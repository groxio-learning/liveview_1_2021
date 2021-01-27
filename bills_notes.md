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

# first time
cd assets
npm install
cd ..
mix deps.get
mix ecto.create

# start app
mix phx.server

# or better for dev:
iex -S mix phx.server
```

## git management

```
git pull upstream main
git push

```
