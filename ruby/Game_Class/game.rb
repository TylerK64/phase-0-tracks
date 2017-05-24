#psuedocode
# write class Game
#attributes: correct answer, guess answers (array), guess counter, is_over (boolean), guess output, win (true)/lose (false)
#methods: check guess, check repeat answer, update output, check game status for win or lose condition
#TDD: write basic game class stuct, check input & output; check repeatable word; check correct output

class Game
  attr_reader :answer, :guess_feedback, :game_status, :guess_answers
  attr_accessor :guess_count

  def initialize(str)
    @answer = str
    @guess_answers = []
    @guess_count = @answer.length
    @is_over = false
    @guess_feedback
    @game_status = false
  end

  def check_guess(str)
    @guess_answers << str
    p @guess_answers
  end

  def check_repeat(str)
    @guess_answers.each do |i|
      if str == i
        @guess_answers.delete_at(@guess_answers.index(i))
      end
    end
  end

end

puts "Please enter your secret word:"
answer = gets.chomp.strip

game = Game.new(answer)

until game.guess_count == 0 || game.game_status != false
  puts "Please enter your guess word:"
  guess = gets.chomp.strip
  game.check_guess(guess)
  #game.check_repeat(guess)
  game.guess_count -= 1
end