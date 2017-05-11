#!/usr/bin/env ruby

likes_garlic = nil
wants_insurance = nil

puts "How many employees will be processed?"
employees = gets.chomp.to_i

while employees > 0
	puts "What is your name?"
	name = gets.chomp

	puts "How old are you?"
	age = gets.chomp.to_i
	puts "What year were you born?"
	year = gets.chomp.to_i

	if 2017-year != age && 2017-year != age+1
		age_year = false
	else
		age_year = true
	end

	loop do
		puts "Would you like garlic bread from our cafe (yes/no)?"
		garlic = gets.chomp
		if garlic == "yes"
			likes_garlic = true
			break
		elsif garlic == "no"
			likes_garlic = false
			break
		end
	end

	loop do 
		puts "Would you like to enroll in the company's health insurance (yes/no)?"
			insurance = gets.chomp
		if insurance == "yes"
			wants_insurance = true
			break
		elsif insurance == "no"
			wants_insurance = false
			break
		end
	end

	if name != "Drake Cula" && name != "Tu Fang"
		if age_year 
			if likes_garlic || wants_insurance
				puts "Probably not a vampire."
			else
				puts "Results inconclusive."
			end
		elsif !age_year
			if !likes_garlic && !wants_insurance
				puts "Almost certainly a vampire."
			elsif !likes_garlic || !wants_insurance
				puts "Probably a vampire."
			else
				puts "Results inconclusive."
			end
		else
			puts "Results inconclusive."
		end
	elsif name == "Drake Cula" || name == "Tu Fang"
		puts "Definitely a vampire."
	end
	employees -= 1
end