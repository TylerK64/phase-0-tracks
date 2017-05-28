class Puppy
  def initialize
    puts "Initializing new puppy instance ..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
    int.times do |x|
      puts "Woof!"
    end
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(human_years)
    human_years * 7
  end

  def lay_down
    puts "I'm now laying down"
  end
end

puppy = Puppy.new
puppy.fetch("toy")
puppy.speak(5)
puppy.roll_over
a = puppy.dog_years(5)
puts a
puppy.lay_down