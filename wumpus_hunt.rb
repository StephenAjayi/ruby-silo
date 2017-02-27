def prompt()
    print(">")
    gets.chomp
end

cave_numbers = (1...21).to_a
player_location = cave_numbers.sample
wumpus_location = cave_numbers.sample

while player_location == wumpus_location
  player_location = cave_numbers.sample
end

puts "Welcome to hunt the Wumpus!"
puts "You can see #{cave_numbers.length} caves"
puts "To play, just type the number"
puts "of the cave you wish to enter"

while true
  puts "You are in cave #{player_location}"
  if player_location == wumpus_location + 1 || player_location == wumpus_location -1
    puts "I smell a wampus"
  end
  puts "Which cave next?"
  player_input = prompt
  if !player_input.to_i.is_a?(Integer) || !cave_numbers.include?(player_input.to_i)
    puts "#{player_input} is not a cave!"
  else
    player_location = player_input.to_i
    if player_location == wumpus_location
      puts "Aargh! You got eaten by a wumpus!"
      break
    end
  end
end
