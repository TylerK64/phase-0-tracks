module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + "!?!?" + " :)"
  end
end

a = "Hello world"
puts Shout.yell_angrily(a)
puts Shout.yelling_happily(a)