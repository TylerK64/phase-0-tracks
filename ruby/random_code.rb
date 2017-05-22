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
  counter = 0
  arr2 = []
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


zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

arr = []
counter = 0

zombie_apocalypse_supplies.each do |item|
  i = zombie_apocalypse_supplies.index(item)
  if i <= zombie_apocalypse_supplies.length-2
    if compare(item, zombie_apocalypse_supplies[i+1])
      arr[i] = item
    elsif !compare(item, zombie_apocalypse_supplies[i+1])
      a = item
      arr[i] = zombie_apocalypse_supplies[i+1]
      arr[i+1] = a
    end
  end
end

#p arr