#ask for basic details of client: name, age, children, decor theme, etc
#store each piece of information as a key value in a 'form' hash, and convert to appropriate data type
#print out all user given info once form is complete
#create a loop re-asking each question (unless user answers none)

form = {
	name: "",
	age: "",
	children: "",
	decor_theme: "",
	colors: [],
	sand: nil
}

puts "What is your name?"
form[:name] = gets.chomp
puts "What is your age?"
form[:age] = gets.chomp.to_i
puts "How many children do you have?"
form[:children] = gets.chomp.to_i
puts "What is your preferred decor theme?"
form[:decor_theme] = gets.chomp

loop do
	counter = 0
	puts "Please enter a few of your favorite colors (type 'exit' when done):"
	form[:colors] << gets.chomp.downcase
	if form[:colors].last.to_s == "exit"
		form[:colors].delete("exit")
		break
	end
	counter += 1
end

until form[:sand] == true || form[:sand] == false
	puts "Do you like sand (true/false)?"
	form[:sand] = gets.chomp.downcase
	if form[:sand] == "true" || form[:sand] == "t"
		form[:sand] = true
	elsif form[:sand] == "false" || form[:sand] == "f"
		form[:sand] = false
	end
end

#puts "Would you like to update any of your information before proceeding?"
#update = gets.chomp

puts "Here is the information you inputted:"
puts "Name: #{form[:name]}" 
puts "Age: #{form[:age]}"
puts "Children: #{form[:children]}" 
puts "Decor theme: #{form[:decor_theme]}"
puts "Really likes sand: #{form[:sand]}"
puts "Here is the compiled list of information just in case: #{form}"