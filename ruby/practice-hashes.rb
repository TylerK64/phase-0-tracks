title = "INTERIOR DESIGN JOB APPLICATION"

form = {
	name: "",
	address: "",
	email: "",
	phone: "",
	color: "",
	paisley: nil,
	chevrons: nil,
	photorealistic: nil,
	abstract: nil,
	fierce: nil,
	last_season: nil,
	medieval: nil,
	test = :new_entry => ""
}

puts "What is your name?"
form[:name] = gets.chomp
puts "Where do you live?"
form[:address] = gets.chomp
puts "What do you like?"
test = gets.chomp

form[:new_entry] += "new text!!"
#form[:new_entry] = "new entry!!"
puts form[:new_entry]

puts test + " extra emphasis!"



puts "What is your favorite color?"
form[:color] = gets.chomp

if form[:color] == "cerulean" || form[:color] == "indigo"
	puts "You got the job!"
else
	puts "Try again next time, sorry."
end



