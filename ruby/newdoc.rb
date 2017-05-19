zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

arr2 = []
var_tot = nil
zombie_apocalypse_supplies.each do |item|
	var_tot = 0
	zombie_apocalypse_supplies.each do |item2|
		var = item <=> item2
		var_tot += var
	end
	arr2 << var_tot
end

#break up each word into its own array of chars
#compare each word array to each other

arr = []
arr2 = zombie_apocalypse_supplies

zombie_apocalypse_supplies.each do |item|
	counter = 0
	char_arr = []
	until counter == item.length
		char_arr[counter] = item[counter]
		counter += 1
	end
	arr << char_arr
end

#p arr

counter = 0
counter2 = 0
#until counter == zombie_apocalypse_supplies.length
	#until counter2 == zombie_apocalypse_supplies[counter].length
		#if arr[counter2] == zombie_apocalypse_supplies[counter][counter2]

until counter == zombie_apocalypse_supplies.length
	zombie_apocalypse_supplies.each do |item|
		#p zombie_apocalypse_supplies[counter]
	end
	counter += 1
end

