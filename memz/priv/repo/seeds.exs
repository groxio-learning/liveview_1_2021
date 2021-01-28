# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Memz.Repo.insert!(%Memz.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Memz.Library
Library.create_passage(
  %{name: "it_crowd",
    steps: 3,
    text: "Did you try turning it off and on again?"}
)

Library.create_passage(
  %{name: "ghandi",
    steps: 3,
    text: "Be the change you want to see"}
)

Library.create_passage(
  %{name: "star_treck",
    steps: 3,
    text: "Beam me up Scotty!"}
)

Library.create_passage(
  %{name: "terminator",
    steps: 2,
    text: "I'll be back!"}
)

Library.create_passage(
  %{name: "moana",
    steps: 2,
    text: "Your welcome"}
)

Library.create_passage(
  %{name: "bible",
    steps: 6,
    text: "The path of the righteous man is beset on all sides by the inequities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee."}
)
