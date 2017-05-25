#psuedocode
# write class Game
#attributes: correct answer, guess answers (array), guess counter, is_over (boolean), guess output, win (true)/lose (false)
#methods: check guess, check repeat answer, update output/feedback, check game status for win or lose condition
#TDD: write basic game class stuct, check input & output; check repeatable word; check correct output
#feedback method: if you find a new char match from guess, add it to the feedback array
#want to set feedback array so once a character is set, it can't be later changed?

class Game
  attr_reader :is_over

  def initialize(str)
    @answer = str
    @guess_answers = []
    @feedback = []
    @guess_count = @answer.length
    @is_over = false
  end

  def check_guess(str)
    if !@guess_answers.include?(str) #if guess_answers doesn't include str, add str to the array
      @guess_answers << str
      @guess_count -= 1
    end
  end

  def feedback(str)
    str.each_char do |i|
      if @answer.include?(i)
        a = @answer.dup
        @answer.count(i).times do |x|
          y = a.index(i) + x
          @feedback[y] = a.slice!(i)
        end
      end    
    end

    @answer.length.times do |x|
      if @feedback[x] == nil
        @feedback[x] = "_"
      end
    end

    @feedback.join(" ")
  end

  def check_status
    if @guess_answers.include?(@answer)
      guess_count = @answer.length - @guess_count
      puts "You found the secret word(s): '#{@answer}' in #{guess_count} guess(es)! You win!"
      @is_over = true
    elsif @guess_count == 0
      puts "Sorry, you lose"
      @is_over = true
    end
  end
end

puts "Please enter your secret word:"
answer = gets.chomp.strip.downcase

game = Game.new(answer)

while !game.is_over
  puts "Please enter your guess word:"
  guess = gets.chomp.strip.downcase
  game.check_guess(guess)
  game.check_status

  if !game.is_over
    puts game.feedback(guess)
  end
end