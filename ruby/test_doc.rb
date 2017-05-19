a = [1, 2, 3, 4, 5]

a.each do |x|
	if x[0] < x[1]
		puts "hey there"
		break
		puts "hello"
	elsif x[2] < x[3]
		puts "hi"
	end
end



#random unedited code for iteration_drill question 2
def find_lowest (arr)
	counter = 0
	lowest_item = ""

	until counter == arr.length
		arr.each do |item|
			var = item <=> arr[counter]
			if var == -1 && lowest_item < arr[counter]
				lowest_item == "hi"
			end
		end
		counter += 1
	end
	return lowest_item
end



def alphabetize (arr)
	arr2 = []
	lowest_item = nil
	not_lowest = nil
	counter = 0
	new_index = 0

	arr.each do |item|
		if item > arr[counter]
			new_index = counter
			break
		end


	arr.each do |item|
		if item > arr[counter]
			new_index = counter



	arr.each do |item|
		var = item <=> arr[counter]
		until not_lowest == false
			if var > -1
				not_lowest = true
			elsif var == -1
				arr.each do |item2|
					var2 = item2 <=> arr[counter2]
					



				


	while lowest_item != true
		counter = 0
		arr.each do |item|
			var = item <=> arr[counter]
			if var < 1
				return
			elsif var == 1
				arr.each do |item2|
					var2 = item2 <=> arr[counter]

				

						

						var2 = item <=> item2
						if var < 1
							return
						elsif var == 1

					
	until counter == arr.length
		counter = 0
		arr.each do |item|
			arr.each do |item2|
			
	end
end
