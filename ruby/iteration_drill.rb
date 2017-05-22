# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----

zombie_apocalypse_supplies.each do |supplies|
  print supplies
  i = zombie_apocalypse_supplies.index(supplies)
  if (i+1) < zombie_apocalypse_supplies.length
    print "*"
  end
end

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----
def compare (string1, string2)
  #compares two strings to find alphabetical order
  #returns true if string1 is first alphabetically or false if string2 is first alphabetically
  #otherwise nil should be returned if the two strings are equal

  counter = 0
  n1 = string1.length - 1
  n2 = string2.length - 1

  while counter < string1.length || counter < string2.length
    if string1[counter] < string2[counter]
      return true
    elsif string2[counter] < string1[counter]
      return false
    end

    if counter == n1 && counter < n2
      return true
    end
    if counter == n2 && counter < n1
      return false
    end
    if counter == n1 && counter == n2
      if string1[counter] < string2[counter]
        return true
      elsif string2[counter] < string1[counter]
        return false
      end
      return nil
    end
    counter += 1
  end
end

def sort_array (arr)
  swapped = true
  while swapped do
    swapped = false
    0.upto(arr.length-2) do |x|
      if !compare(arr[x], arr[x+1])
        arr[x], arr[x+1] = arr[x+1], arr[x]
        swapped = true
      end
    end
  end
  return arr
end

p sort_array(zombie_apocalypse_supplies)

#not sure why 'CB radio' comes before 'batteries'
#checked in irb and online for alphabetical rules and it seems that capitalized letters take precedence
#over lowercase letters, but I would intuitively think a lowercase 'b' should come before uppercase 'C'

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
arr1 = []
5.times do |x|
  arr1[x] = zombie_apocalypse_supplies[x]
end
zombie_apocalypse_supplies = arr1
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

extinct_animals.each do |animal, year|
  print animal + "-" + year.to_s
  if year != 1923
    print " * "
  end
end


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


# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----

not_extinct = {}
not_extinct = extinct_animals.select {|key, value| key == "Passenger Pigeon"}
not_extinct = not_extinct.to_a.flatten
#p not_extinct
#p extinct_animals

#Couldn't find a method that deletes and returns the key value pair as an array (as one process).