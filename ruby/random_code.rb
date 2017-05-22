def bubble_sort(array)
  return if array.length <= 1
  swapped = true
  while swapped do
    swapped = false
    0.upto(array.length-2) do |x|
      if array[x] > array[x+1]
        a = array[x]
        array[x] = array[x+1]
        array[x+1] = a
        swapped = true
      end
    end
  end
  array
end
a = [5,4,3,2,1]
#ignore for now, saving for later



zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]
def compare (string1, string2)
  #compares two strings to find alphabetical order
  #returns true if string1 is first alphabetically or false if string2 is first alphabetically
  #otherwise nil should be returned if the two strings are equal
  counter = 0
  while counter <= string1.length || counter <= string2.length
    if counter == string1.length && counter < string2.length
      return true
    end
    if counter == string2.length && counter < string1.length
      return false
    end
    if counter == string1.length && counter == string2.length
      return nil
    end

    if string1[counter] < string2[counter]
      true
    elsif string2[counter] < string1[counter]
      false
    end
    counter += 1
  end
end
p "j" < " "

p compare("hii", "hi")