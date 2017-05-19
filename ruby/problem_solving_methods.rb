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

