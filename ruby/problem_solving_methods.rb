#find a method that takes an arr and integer
#iterate through the array, looking for if integer equals any of the items
#if equal, return the index

def search_arry (arr, int)
	counter = 0
	while counter < arr.length
		if arr[counter] == int
			return counter
		end
		counter += 1
	end
	nil
end

arr = [42, 89, 23, 1]
search_arry(arr, 24)

def fib(int)
  array = [0, 1]
  counter = 0
  while counter < int
    if array.length < int
      next_number = array[-1] + array[-2]
      array << next_number
    end
    counter += 1
  end
  return array
end

# Release 2 : Sort an Array

# Define a method that takes an array of numbers
# Compare the 1st and 2nd items in the array :
  # and if 1st < 2nd, leave as-is
  # otherwise switch them reverse the swap them
# Then move on to the 2nd and 3rd items in the array
  # if 2nd < 3rd, leave as-is
  # otherwise switch them/ reverse/ swap
# Then move onto the 3rd and 4th...
# Once all items have been compared, perform a check
  # If 1st < 2nd < 3rd < 4th.. (and so on) is true, you're done!
  # Otherwise, must start the process again, starting at 1st and 2nd items.
# Repeat the process until 1st < 2nd < 3rd < 4th is true

def bubble_sort(array)
  swapped = true
  while swapped
    swapped = false
    array.each do |index|
      if index < (array.length - 2)
        if array[index + 1] > array[index]
          a = array[index]
          array[index] = array[index + 1]
          array[index + 1] = a
          swapped = true
        end
      end
    end
  end
  array
end

array = [5, 1, 4, 2, 8]
p bubble_sort(array)