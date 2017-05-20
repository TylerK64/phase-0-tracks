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
end

vowels = {
	a: "e",
	e: "i",
	i: "o",
	o: "u",
	u: "a"
}

#puts vowels.has_key?(:a)

public def next_vowel(key)
	vowels = {a: "e", e: "i", i: "o", o: "u", u: "a"}
	if vowels.has_key?(key) 
		  key = vowels[key]
	end
end

=begin
a = []
a << next_vowel(:a)
p a
=end

def is_vowel?(char)
	vowels = {a: "e", e: "i", i: "o", o: "u", u: "a"}
	if vowels.has_value?(char)
		 return true
	end
end

=begin
a = is_vowel?("a")

if is_vowel?("a") 
	p next_vowel(:a)
end
=end

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
	name = gets.chomp.strip.downcase
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