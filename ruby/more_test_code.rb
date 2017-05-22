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

a = [1, 2, 3, 4]

a.length.times do |i|
  if a[i] == 3
    b = a.slice!(i)
    a << 5
  end
end

puts a