#set up caves

cave_numbers = (0...20)

caves = []

#add cave structure

cave_numbers.each do |cave|
  caves.push([])
end

unvisited_caves =  (0...20).to_a
visited_caves = [0]
unvisited_caves.delete(0)

#make sure tunnels are all connected

while unvisited_caves !=[] #while there are still caves that haven't been visited
  i = visited_caves.sample #choose a random cave that's been visited
  if caves[i].length >= 3 #if cave is connected to 3 or more caves skip
    next
  end

  next_cave = unvisited_caves.sample #choose random unvisited cave
  caves[i].push(next_cave) #connect visited cave to random unvisited cave
  caves[next_cave].push(i) #connect random unvisited cave to visited cave so tunnel goes both ways

  visited_caves.push(next_cave) #add random unvisited to visited caves
  unvisited_caves.delete(next_cave) #delete ramndom unvisited cave from  from unvisited caves

  cave_numbers.each do |number| # itterate over each cave
    puts "#{number}: #{caves[number]}" #print cave and the tunnels it has
  end
  puts "---------------------" #print dividing line
end

# cunnect the rest of the caves

cave_numbers.each do |i| #itterate over each cave
  while caves[i]. length < 3 # while cave has less than 3 or fewer tunnels
    passage_to = cave_numbers.to_a.sample # randomly choose cave
    caves[i].push(passage_to) # add tunnel to cave

    cave_numbers.each do |number| # itterate over each cave
      puts "#{number}: #{caves[number]}" #print cave and the tunnels it has
    end
    puts "----------------" #print dividing line
  end
end
