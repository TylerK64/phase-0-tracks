#psuedocode
# write class Game
#attributes: correct answer, guess answers (array), guess counter, is_over (boolean), guess output, win (true)/lose (false)
#methods: check guess, update output, check repeate answer, check if win or lose
#TDD: write basic game class stuct, check input & output; check repeatable word; check correct output

class Game
  attr_reader :answer, :guess_feedback
  attr_accessor :guess_count

  def initialize(str)
    @answer = str
    @guess_answers = []
    @guess_count = 0
    @is_over = false
    @guess_feedback
    @game_status
  end
end

puts "Please enter your secret word:"
answer = gets.chomp.strip

game = Game.new(answer)