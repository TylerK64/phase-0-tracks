#create an array with two items using .split(' ')
#swap first and last name
#split name into individual chars using .split('')
#method is_vowel? - 
#method next_vowel - 
#

class String
	def is_upper?
		return false if self.size > 1
		('A'..'Z').include? self
	end

	def is_lower?
		return false if self.size > 1
		('a'..'z').include? self
	end
end

public def next_vowel(key)
	vowels = {'a' => 'e', 'e' => 'i', 'i' => 'o', 'o' => 'u', 'u' => 'a'}
	if vowels.has_key?(key) 
		  key = vowels[key]
	end
end

def is_vowel?(char)
	vowels = {'a' => 'e', 'e' => 'i', 'i' => 'o', 'o' => 'u', 'u' => 'a'}
	if vowels.has_value?(char)
		true
	else
		false
	end
end

def next_cons(key)
	cons = {'d' => 'f', 'h' => 'j', 'n' => 'p', 't' => 'v', 'z' => 'b'}
	if cons.has_key?(key)
		key = cons[key]
	end
end

def special_cons?(char)
	cons = {'d' => 'f', 'h' => 'j', 'n' => 'p', 't' => 'v', 'z' => 'b'}
	if cons.has_key?(char)
		true
	else
		false
	end
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
			char = next_vowel(char)
		elsif special_cons?(char)
			char = next_cons(char)
		else
			char = char.next
		end
	end
	first_name_encrypt = first_name.join('')
	if !first_name_encrypt[0].is_upper?
		first_name_encrypt.capitalize!
	end

	if last_name != nil
		last_name = last_name.split('')
		last_name.map! do |char|
			if is_vowel?(char)
				char = next_vowel(char)
			elsif special_cons?(char)
				char = next_cons(char)	
			else
				char = char.next
			end
		end
		last_name_encrypt = last_name.join('')
		if !last_name_encrypt[0].is_upper?
			last_name_encrypt.capitalize!
		end
		full_name_encrypt = last_name_encrypt + " " + first_name_encrypt
	else
		full_name_encrypt = first_name_encrypt
	end	
end

names_hash = {}

loop do 
	puts "Please enter your name (type 'quit' to exit):"
	name = gets.chomp.strip.downcase
	if name == "quit"
		if !names_hash.empty?
			names_hash.each do |name, fake_name|
				puts "The actual name of #{fake_name} is #{name}."
			end
		else
			puts "You didn't input any names or the names were too long."	
		end
		break
	elsif name.split(' ')[2] != nil
		puts "Try again."
	elsif name != "" && name.split(' ')[2] == nil
		names_hash[name] = encrypt(name)
		puts encrypt(name)
	end
end