module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words + "?!?!" + " :)"
  end

=begin
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + "!?!?" + " :)"
  end
=end
end

class Referee
  include Shout
end

class Teacher
  include Shout
end

b = "Hey world"
ref = Referee.new
puts ref.yell_angrily(b)
teach = Teacher.new
puts teach.yell_happily(b)

#a = "Hello world"
#puts Shout.yell_angrily(a)
#puts Shout.yelling_happily(a)