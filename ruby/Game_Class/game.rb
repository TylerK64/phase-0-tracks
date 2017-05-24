#psuedocode
# write class Game
#attributes: correct answer, guess answers (array), guess counter, is_over (boolean), guess output, win (true)/lose (false)
#methods: check guess, check repeat answer, update output/feedback, check game status for win or lose condition
#TDD: write basic game class stuct, check input & output; check repeatable word; check correct output

class Game
  attr_reader :is_over, :guess_count

  def initialize(str)
    @answer = str
    @guess_answers = []
    @guess_count = @answer.length
    @guess_feedback
    @is_over = false
  end

  def check_guess(str)
    if !@guess_answers.include?(str) #if guess_answers doesn't include str, add str to the array
      @guess_answers << str
      @guess_count -= 1
    end
    p @guess_answers
  end

  def feedback

  end

  def check_status
    if @guess_answers.include?(@answer)
      puts "You found the secret word: #{@answer}. You win!"
      @is_over = true
    elsif @guess_count == 0
      puts "Sorry, you lose"
      @is_over = true
    end
  end
end

puts "Please enter your secret word:"
answer = gets.chomp.strip

game = Game.new(answer)

while !game.is_over
  puts "Please enter your guess word:"
  guess = gets.chomp.strip
  game.check_guess(guess)
  game.check_status
end