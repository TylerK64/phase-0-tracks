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