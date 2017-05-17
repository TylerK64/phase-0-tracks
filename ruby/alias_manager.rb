#create an array with two items using .split(' ')
#swap first and last name
#split name into individual chars using .split('')
#find all the vowels in each array
#use .next to make all vowels increase by 1 character

class String
	def is_upper?
		self == self.upcase
	end

	def is_lower?
		self == self.downcase
	end
end


def is_vowel? (char)
	if char == 'A' || char == 'E' || char == 'I' || char == 'O' || char == 'U'
		true
	elsif char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'o'
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
	last_name = last_name.split('')


	first_name.map! do |char|
		if char.is_upper? && (char == 'A' || char == 'E' || char == 'I' || char == 'O' || char == 'U')
				next_vowel(char)
		elsif char.is_lower? && (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'o')
				next_vowel(char)
		else
			char = char
		end
	end

	last_name.map! do |char|
		if char.is_upper? && (char == 'A' || char == 'E' || char == 'I' || char == 'O' || char == 'U')
				next_vowel(char)
		elsif char.is_lower? && (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'o')
				next_vowel(char)
		else
			char = char
		end
	end

	first_name_encrypt = first_name.join('')
	last_name_encrypt = last_name.join('')
	full_name_encrypt = last_name_encrypt + " " + first_name_encrypt

	puts first_name_encrypt
	puts last_name_encrypt
	puts full_name_encrypt
end

name = "Felicia Torres"
encrypt(name)