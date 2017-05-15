# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
"iNvEsTiGaTiOn".replace(“InVeStIgAtIoN”)
#technically #replace should work for all strings in this assignment so it will not be included for the rest of the exercises.
# => “InVeStIgAtIoN”

"zom".gsub(/o/, 'oo')
"zom".sub(/o/, 'oo') #sub and gsub can be used for most if not all of these excersizes as well so will not be included further.
"zom".insert(1, 'o')
"zom".insert(2, 'o')
"zom".insert(-2, 'o')
"zom".insert(-3, 'o')
"zom"["z"] = "zoom" 
"zom"[1..2] = "zoom"
"zom"[1, 2] = "zoom" #this type of method can also be used for most of this assignment and therefore will not be included further.
# => “zoom”

"enhance".ljust(11).prepend("    ")
"enhance".rjust(11).ljust(15)
"enhance".center(15)
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

"the usual" + " suspects".to_s
"the usual" << " suspects"
"the usual".concat(" suspects")
#=> "the usual suspects"

"the usual" + " suspects"
" suspects".prepend("the usual")
# => "the usual suspects"

"The case of the disappearing last letter".chomp("r")
"The case of the disappearing last letter".chop
#"The case of the disappearing last letter".delete("e","er", "^e")
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

"z".bytes
"z".getbyte(0)
#"z".each_codepoint {|c| print c, ' ' }
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

"How many times does the letter 'a' appear in this string?".count("a")
# => 4