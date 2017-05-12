volume = nil
candidate = nil
age = nil

puts "What's the hamsters name?"
name = gets.chomp

loop do
puts "What's the volume level of the hamster?"
volume = gets.chomp.to_f
	if volume <= 10 && volume >= 1
		volume = volume.to_i
		break
	end
	puts "Try a value from 1 to 10."
end

puts "What's the hamster's fur color?"
fur_color = gets.chomp

loop do
puts "Is the hamster a good candidate for adoption?"
candidate = gets.chomp.downcase
	if candidate == "yes" || candidate == "no" || candidate == "y" || candidate == "n"
		if candidate == "y"
			candidate = "yes"
		elsif candidate == "n"
			candidate = "no"
		end
	break
	end
	puts "Try again (yes or no)."
end

loop do
puts "What's the hamster's estimated age?"
age = gets.chomp
	if age.to_f > 0
		break
	elsif age == "0"
		break
	elsif age == ""
		age = nil
		break
	end
	puts "Invalid response. Try again."
end

puts "Hamster's name is: #{name}"
puts "Hamster's volume level is: #{volume}"
puts "Hamster's fur color is: #{fur_color}"
puts "Is the hamster recommended for adoption: #{candidate}"

if age != nil
	puts "Hamster's age is #{age}"
else 
	puts "Hamster's age is unknown."
end