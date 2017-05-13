def encrypt (str)
	stry = str
	strz = "abcdefghijklmnopqrstuvwxyz"
	counter = 0

	until counter == str.length
		x = strz.index(stry[counter])
		if x == 25
			y = 0
		else
			y = x + 1
		end
		stry[counter] = strz[y]
		counter += 1
	end
#puts stry
return stry
end

def decrypt(str)
	stry = str
	strz = "abcdefghijklmnopqrstuvwxyz"
	counter = 0

	until counter == str.length
		x = strz.index(stry[counter])
		y = x - 1
		stry[counter] = strz[y]
		counter += 1
	end
#puts stry
return stry
end

#Both methods return a string which can be used for the other method if desired.

puts "Would you like to 'encrypt' or 'decrypt'?"
str = gets.chomp

puts "What is your password?"
password = gets.chomp

if str == "encrypt"
	password = encrypt(password)
	puts password
elsif str == "decrypt"
	password = decrypt(password)
	puts password
else	
	puts "Answer invalid."
end

#Could make a while loop around the conditional code for invalid input condition.