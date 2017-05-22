class Santa
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
    #puts "Also my ethnicity is #{@ethnicity}"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type} cookie!"
  end
end

#santa1 = Santa.new
#santa1.speak
#santa1.eat_milk_and_cookies("chocolate chip")

santas = []
genders = ["male", "female", "other", "gender fluid", "unsure", "male", "female"]
ethnicities = ["white", "black", "Chinese", "Italian", "Russian", "Canadian", "Native American"]

genders.length.times do |i|
  santas << Santa.new(genders[i], ethnicities[i])
  santas[i].speak
end