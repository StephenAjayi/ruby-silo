supermarket_list = ['Milk', 'Bread', 'Cheese']

wumpus_r_us_list =  ['Rope', 'Lantern', 'Wumpus B Gone']
p "Wumpus hunting checklist:"

for each_item in wumpus_r_us_list do
  p each_item
  if each_item == "Lantern"
    p "Don't forget to light your lantern"
    p "once you're doen there."
  end
end
