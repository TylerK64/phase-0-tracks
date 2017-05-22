class Santa
  attr_reader :ethnicity, :reindeer_ranking
  attr_accessor :gender, :age

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

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.length.times do |i|
      if reindeer_name == @reindeer_ranking[i]
        a = @reindeer_ranking.slice!(i)
        @reindeer_ranking << a
      end
    end
  end
end

#santa1 = Santa.new
#santa1.speak
#santa1.eat_milk_and_cookies("chocolate chip")

santas = []
genders = ["male", "female", "other", "gender fluid", "unsure", "agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
ethnicities = ["white", "black", "Chinese", "Italian", "Russian", "Canadian", "Native American", "Latino", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

=begin
genders.length.times do |i|
  santas << Santa.new(genders[i], ethnicities[i])
  santas[i].celebrate_birthday
  puts santas[i].age
end

puts santas[0].gender=("not male")
santas[0].get_mad_at("Vixen")
puts santas[0].reindeer_ranking
=end

n = 0
until n == 1000
  santas << Santa.new(genders.sample, ethnicities.sample)
  santas[n].age = rand(0..140)
  puts santas[n].gender, santas[n].age, santas[n].ethnicity
  p santas[n].reindeer_ranking
  n += 1
end