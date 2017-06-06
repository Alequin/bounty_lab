require ("pry-byebug")
require_relative("bounty_hunter")

hunter1 = BountyHunter.new({
  "name" => "Josie Wales",
  "species" => "Cowboy",
  "bounty_value" => 9,
  "danger_level" => "medium"
  })

hunter2 = BountyHunter.new({
  "name" => "Babafet",
  "species" => "Spaceman",
  "bounty_value" => 8,
  "danger_level" => "high"
  })

hunter1.save()
hunter2.save()

hunter1.name = "Josepi Scotland"
hunter1.update

# hunter1.delete ()
# hunter2.delete ()

hunter3 = BountyHunter.find(1)
puts hunter3.name
