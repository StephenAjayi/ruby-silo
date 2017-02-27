supermarket_list = ['Milk', 'Bread', 'Cheese']

p supermarket_list
puts supermarket_list[0]
puts supermarket_list[-1]

if supermarket_list.include?('Milk')
  puts "Oh good, you remembered the milk!"
end

wumpus_r_us_list = ['Bow and Arrow', 'Lantern', 'Wumpus B Gone']

p wumpus_r_us_list
puts wumpus_r_us_list[0]
puts wumpus_r_us_list[-1]

if wumpus_r_us_list.include?('Bow and Arrow')
  puts "Oh good, you remembered the bow and arrow"
end

wumpus_r_us_list.push('Rope')
wumpus_r_us_list.delete("Wumpus B Gone")

shopping_lists = [supermarket_list, wumpus_r_us_list]

p shopping_lists

p supermarket_list[0..3]
p supermarket_list[1..-1]
