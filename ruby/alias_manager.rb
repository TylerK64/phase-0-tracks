#create an array with two items using .split(' ')
#swap first and last name
#split name into individual chars using .split('')
#find all the vowels in each array
#use .next to make all vowels increase by 1 character
class String
	def is_upper?
		return false if self.size > 1
		('A'..'Z').include? self
	end

	def is_lower?
		return false if self.size > 1
		(a..z).include? self
	end
end


def next_vowel (char)
	if char == 'A' || char == 'E' || char == 'I' || char == 'O' || char == 'U'
		true
	elsif char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u'
		true
	else
		false
	end
end

if "A".is_upper?
	puts "A is upper"
end




def encrypt (full_name)
	if full_name == "quit"
		return
	elsif full_name == ""
		return
	end

	first_name = full_name.split(' ')[0]
	last_name = full_name.split(' ')[1]

	first_name = first_name.split('')
	first_name.map! do |char|
		if is_vowel?(char)
			next_vowel(char)
		else
			char = char
		end
	end
	first_name_encrypt = first_name.join('')

	if last_name != nil
		last_name = last_name.split('')
		last_name.map! do |char|
			if is_vowel?(char)
				next_vowel(char)
			else
				char = char
			end
		end
		last_name_encrypt = last_name.join('')
		full_name_encrypt = last_name_encrypt + " " + first_name_encrypt
	else
		full_name_encrypt = first_name_encrypt
	end	
end

names_list = []
fake_names_list = []

loop do 
	puts "Please enter your name (type 'quit' to exit):"
	name = gets.chomp.strip
	if name == "quit"
		full_name_list = names_list.zip(fake_names_list)
		if !full_name_list.empty?
			full_name_list.each do |name, fake_name|
				puts "The actual name of #{fake_name} is #{name}."
			end
		else
			puts "You didn't input any names or the names were too long."	
		end
		break
	elsif name.split(' ')[2] != nil
		puts "Try again."
	elsif name != "" && name.split(' ')[2] == nil
		names_list << name
		fake_names_list << encrypt(name)
		puts encrypt(name)
	end
end