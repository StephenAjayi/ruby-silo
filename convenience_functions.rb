def create_tunnel(cave_from, cave_to)
  #Create tunnel between cave_from and cave_to
  cave_from.push(cave_to)
  cave_to.push(cave_from)
end

def visit_cave(cave_number)
  #Mark a cave as visited
  visit_caves.push(cave_number)
  unvisited_caves.delete(cave_number)
end

def choose_cave(cave_list)
  #Pick a cave from a list, provided that the cave has less than 3 tunnels
  cave_number = cave_list.sample
  while caves[cave_number].length >= 3
    cave_number = cave_list.sample
  end
  return cave_ number
end

def print_caves()
  #print out the current cave structure
  cave_numbers.each do |number|
    puts "#{number}: #{caves[number]}"
  end
  puts "-------------"
end

def setup_caves(cave_numbers)
  #Create the starting list of caves
  caves = []
  cave_numbers.each do |cave|
    caves.push([])
  end
  return caves
end

def link_caves()
  #Make sure all of the caves are connected with two-way tunnels
  while unvisited_caves != []
    this_cave = choose_cave(visited_caves)
    next_cave =  choose_cave(unvisited_caves)
    create_tunnel(this_cave, next_cave)
    visit_cave(this_cave)
  end
end

def finish_caves ()
  #Link the rest of the caves with one-way tunnels
  cave_numbers.each do |cave|
    while caves[cave].length < 3
      passage_to = choose_cave(cave_numbers)
      caves[cave].push(passage_to)
    end
  end
end
