#!/usr/bin/env ruby

def name
	puts "What is your name?"
	name = gets.chomp
end

def age_year
	puts "How old are you?"
	age = gets.chomp.to_i
	puts "What year were you born?"
	year = gets.chomp.to_i

	if 2017-year != age && 2017-year != age+1
		return false
	end
end

def garlic
	puts "Would you like garlic bread from our cafe?"
	garlic = gets.chomp
end

def insurance
	puts "Would you like to enroll in the company's health insurance?"
	insurance = gets.chomp
end

if age_year == true && insurance == true
	puts "looking good!"
end
