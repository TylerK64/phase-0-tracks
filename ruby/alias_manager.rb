#create an array with two items using .split(' ')
#swap first and last name
#split name into individual chars using .split('')
#find all the vowels in each array
#use .next to make all vowels increase by 1 character

def is_vowel? (char)
	if char == 'A' || char == 'E' || char == 'I' || char == 'O' || char == 'U'
		true
	elsif char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u'
		true
	else
		false
	end
end

def next_vowel (char)
	char = char.next
end


def encrypt (full_name)
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

loop do 
	puts "Please enter your name (type 'quit' to exit):"
	name = gets.chomp
	if name == "quit"
		break
	end
	puts encrypt(name)
end