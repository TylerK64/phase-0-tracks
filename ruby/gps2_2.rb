# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Initialize with blank array, split parameter and iterate through the list with default quantity = 1
  # print the list to the console [can you use one of your other methods here?]
# output: hash
def create_list(string)
  list = {}
  string.split(' ').each {|item| list[item] = 1}
  list
end
# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: choose list to add item, name item, and choose whether we want to add to the default quantity
# output: hash
def add_item(list,item,quantity=1)
  list[item] = quantity
  list
end
# Method to remove an item from the list
# input: list, item name
# steps: choose list to add item, name item that is to be removed
# output: hash
def remove_item(list,item)
  list.delete_if {|key,value| key == item}
  list
end
# Method to update the quantity of an item
# input: list, item name, quanitity
# steps: choose list for item, find if list has item, change quanity, else put error message
# output: hash or string
def change_quantity(list,item,quantity)
  if list.has_key?(item)
    list[item] = quantity
  else
    puts "Item not found."
  end
  list
end
# Method to print a list and make it look pretty
# input: list
# steps: iterate through list and print each key, value pair
# output: string
def print_list(list)
  list.each {|key,value| puts "You need #{value} #{key}(s)."}
end

=begin
p shopping_list = create_list("broom brush pot")
p add_item(shopping_list,"banana")
p remove_item(shopping_list,"pot")
p change_quantity(shopping_list,"brush",3)
print_list(shopping_list)
=end

shopping_list = create_list("lemonade tomatoes onions ice_cream")
change_quantity(shopping_list, "lemonade", 2)
change_quantity(shopping_list, "tomatoes", 3)
change_quantity(shopping_list, "ice_cream", 4)
remove_item(shopping_list, "lemonade")
change_quantity(shopping_list, "ice_cream", 1)
print_list(shopping_list)