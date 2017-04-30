#setup caves class
class Caves
  #initialize instance variables
  define_method(:initialize) do |caves, unvisited_caves, visited_caves|
    @caves = caves
    @unvisited_caves = unvisited_caves.to_a
    @visited_caves = visited_caves
  end

  def create_tunnel(cave_from, cave_to)
    #Create tunnel between cave_from and cave_to
    @caves[cave_from].push(cave_to)
    @caves[cave_to].push(cave_from)
  end

  def visit_cave(cave_number)
    #Mark a cave as visited
    @visited_caves.push(cave_number)
    @unvisited_caves.delete(cave_number)
  end

  def choose_cave(cave_list)
    #Pick a cave from a list, provided that the cave has less than 3 tunnels
    cave_number = cave_list.sample
    while @caves[cave_number].length >= 3
      cave_number = cave_list.sample
    end
    return cave_number
  end

  def print_caves(cave_numbers)
    #print out the current cave structure
    cave_numbers.each do |number|
      puts "#{number}: #{@caves[number]}"
    end
    puts "-------------"
  end

  def setup_caves(cave_numbers)
    #Create the starting list of caves
    cave_numbers.each do
      @caves.push([])
    end
    return @caves
  end

  def link_caves()
    #Make sure all of the caves are connected with two-way tunnels
    while @unvisited_caves != []
      this_cave = choose_cave(@visited_caves)
      next_cave = choose_cave(@unvisited_caves)
      create_tunnel(this_cave, next_cave)
      visit_cave(next_cave)
    end
  end

  def finish_caves(cave_numbers)
    #Link the rest of the caves with one-way tunnels
    cave_numbers.each do |cave|
      while @caves[cave].length < 3
        passage_to = choose_cave(cave_numbers.to_a)
        @caves[cave].push(passage_to)
      end
    end
  end

  def prompt()
    #Get player input
    print ">"
    response = gets.chomp()
    return Integer(response) rescue response
  end

  def print_location(player_location, wumpus_location)
    #Tell the player about where they are
    puts "You are in cave #{player_location}"
    puts "From here you can see caves:"
    puts "#{@caves[player_location]}"
    if @caves[player_location].include?(wumpus_location)
      puts "I smell a wumpus!"
    end
  end

  def get_next_location(player_location)
    #Get the players next location
    puts "\n" +  "Which cave next?"
    player_input = prompt()
    if(!player_input.is_a?(Integer) || !@caves[player_location].include?(player_input))
      puts  "\n" + "#{player_input}?"
      puts "Thats not a direction that I can see"
      return nil
    else
      return player_input
    end
  end
end
#initialize caves
cave_numbers = (0...20)
cave_args = Caves.new([], 0...20, [])

#create cave structure
caves = cave_args.setup_caves(cave_numbers)
cave_args.visit_cave(0)
cave_args.print_caves(cave_numbers)
cave_args.link_caves
cave_args.print_caves(cave_numbers)
cave_args.finish_caves(cave_numbers)
cave_args.print_caves(cave_numbers)

wumpus_location = cave_numbers.to_a.sample
player_location = cave_numbers.to_a.sample
while wumpus_location == player_location
  player_location = cave_numbers.to_a.sample
end

while true
  cave_args.print_location(player_location, wumpus_location)
  new_location = cave_args.get_next_location(player_location)
  puts "\n"
  if new_location != nil
    player_location = new_location
    if player_location == wumpus_location
      puts "Aargh! You got eaten by a wumpus!"
      break
    end
  end
end
