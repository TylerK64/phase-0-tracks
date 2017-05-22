class Puppy
  def initialize
    puts "Initializing new puppy instance..."
  end

  def speak(int)
    int.times do |x|
      puts "Woof!"
    end
  end
end

doggo = Puppy.new
doggo.speak(2)