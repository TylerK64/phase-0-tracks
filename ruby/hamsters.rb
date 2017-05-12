puts "What's the hamsters name?"
name = gets.chomp

loop do
puts "What's the volume level of the hamster (1 to 10)?"
volume = gets.chomp.to_i
	if volume <= 10 && volume >= 1
		break
	end
end

puts "What's the fur color?"
fur_color = gets.chomp

loop do
puts "Is the hamster a good candidate for adoption?"
candidate = gets.chomp.downcase
	if candidate == "yes" || candidate == "no" || candidate == "y" || candidate == "n"
		break
	else
		puts "Try again"
	end
end

loop do
puts "What's the hamsters estimated age?"
age = gets.chomp
	if age.to_i >= 0
		break
	elsif age == ""
		age = nil
		break
	end
end
