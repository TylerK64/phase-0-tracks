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

=begin
Release 4: Reflect
1. Pseudocoding was useful in this challenge in order to gain a sense of how each method worked specifically. 
Noting the inputs and outputs of each method definitely helps ease the workflow as you know exactly what types of data are expected on both ends of the method. 
Knowing these key pieces of information allows for easier manipulation of the data over the long term since you know what the expected output should be.
Also breaking each major block of code down into smaller steps is very useful concept, and I'm sure I'll need to do this often in the future as well.

2. Arrays are useful when collecting a set of data that basically only requires the name of the piece of data itself (ie a list of names, or list of any class type). 
Hashes are a better option when another key piece of information is additionally required and linked to the original piece of data (ie a list of items each with its own quantity, or a list of names each with its own address). 
A solution using multiple arrays instead of hashes for this challenge is possible, but would be much less preferable since the link between each item and it's quantity would be maintained only by index number, which has plenty of downsides. Not to mention manipulating the data in this fashion would also be much more unecessarily difficult.

3. A method returns the last evaluated line of code within a method if there is no return statement.
If there is an explicit return, denoted by the keyword 'return', then the evaluated expression after the keyword 'return' is returned.

4. Any data type can be passed into a method as an argument, as long as it is properly defined as a parameter when defining the method.
Also if the parameter is a required parameter, then that argument MUST be passed into each method use otherwise the method will not run properly.

5. By knowing the type of input(s) and output(s) each method requires and returns (respectively), a programmer can pass and manipulate this data 'on the fly.'
Keeping track of what kind of information is passed from each method is important for implementing each method so the piece of data can be used in its appropriate context.

6. How methods work specifically and how to use their input and return values was cleared up a good amount for me during this assignment. 
While this challenge helped me become more familiar with hashes, I still think I'm still not as comfortable as I'd like to be with implementing, maniuplating, etc. hashes in general.
I'm generally decent with arrays due to prior experience, but I'd like to practice a bit more with hashes and be able to work with their key-value pairs more comfortably.
=end