# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----
=begin
zombie_apocalypse_supplies.each do |supplies|
  print supplies
  if supplies != "batteries"
  print "*"
  end
end
=end

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----
=begin
arr = []
var_arr = []
counter = 0
var_count = 0

zombie_apocalypse_supplies.each do |item|
	while counter < zombie_apocalypse_supplies.length
		var = item <=> zombie_apocalypse_supplies[counter]
		counter += 1
		var_arr[zombie_apocalypse_supplies.index(item)] += var
		puts var
	end
end
puts var_arr
=end

# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----

def check_string(string)
	zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]
	zombie_apocalypse_supplies.each do |item|
		if string.downcase == item.downcase
			return true
		end
	end
  false
end

#puts check_string("shotgun")
#puts check_string("water")

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----
arr = []
5.times do |x|
  arr[x] = zombie_apocalypse_supplies[x]
end
zombie_apocalypse_supplies = arr
#p zombie_apocalypse_supplies

# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----
combined_supplies = zombie_apocalypse_supplies | other_survivor_supplies
#p combined_supplies


# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----
=begin
extinct_animals.each do |animal, year|
  print animal + "-" + year.to_s
  if year != 1923
    print " * "
  end
end
=end

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----
extinct_animals2 = {}
extinct_animals.map do |animal, year|
  if year < 2000
    extinct_animals2[animal] = year
  end
end
extinct_animals = extinct_animals2
#p extinct_animals

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----
extinct_animals.map do |animal, year|
  extinct_animals[animal] = year - 3
end
#p extinct_animals

# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----
=begin
if extinct_animals.has_key?("Andean Cat")
  puts "Andean Cat is in extinct_animals"
else
  puts "Andean Cat is not in extinct_animals"
end
if extinct_animals.has_key?("Dodo")
  puts "Dodo is in extinct_animals"
else
  puts "Dodo is not in extinct_animals"
end
if extinct_animals.has_key?("Saiga Antelope")
  puts "Saiga Antelope is in extinct_animals"
else
  puts "Saiga Antelope is not in extinct_animals"
end
=end

# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----
#Couldn't find a method that deletes and returns the key value pair as an array (as one process).
not_extinct = {}
not_extinct = extinct_animals.select {|key, value| key == "Passenger Pigeon"}
not_extinct = not_extinct.to_a.flatten
#p not_extinct
#p extinct_animals