def prompt()
    print(">")
    gets.chomp
end

cave_numbers = (0...20)
caves = []

for i in cave_numbers
  caves.push([])
end

for i in cave_numbers
  for j in (0..2)
    passage_to = cave_numbers.to_a.sample
    caves[i].push(passage_to)
  end
end

player_location = cave_numbers.to_a.sample
wumpus_location = cave_numbers.to_a.sample

while player_location == wumpus_location
  player_location = cave_numbers.sample
end

puts "Welcome to hunt the Wumpus!"
puts "You can see #{cave_numbers.to_a.length} caves"
puts "To play, just type the number"
puts "of the cave you wish to enter"

while true
  puts "You are in cave #{player_location}"
  puts "From here you can see caves:#{caves[player_location]}"
  if caves[player_location].include?(wumpus_location)
    puts "I smell a wampus"
  end
  puts "Which cave next?"
  player_input = prompt
  if !player_input.to_i.is_a?(Integer) || !caves[player_location].include?(player_input.to_i)
    puts "#{player_input}?"
  puts "That's not a direction I can see!"
  else
    player_location = player_input.to_i
    if player_location == wumpus_location
      puts "Aargh! You got eaten by a wumpus!"
      break
    end
  end
end
