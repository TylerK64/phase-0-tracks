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
    p @guess_answers
  end

  def feedback(str)
    a = @answer
=begin
    str.length.times do |i|
      if @answer.include?(str[i])
        @answer.each_char do |j|
          if j == str[i] && feedback[@answer.index(j)] == "_"
            feedback[@answer.index(j)] = str[i]
          end
        end
      end
      p feedback
    end

    @answer.each_char do |i|    #@answer.length.times do |i|?
      a = @answer.index(i)
      if str.include?(i)
        @feedback[a] = i
      elsif @feedback[a] == nil
        @feedback[a] = "_"
      end
      p @feedback
    end
=end
    
    str.each_char do |i|
      if @answer.include?(i) #&& feedback[str.index(i)].empty?
        @answer.count(i).times do |j|
          a = @answer.
          @feedback[@answer.index(j)] = i
        end
      end
      p @feedback
     
    end

  end

  def find_index(char)
    a = []
    @answer.each_char do |i|
      if char == i
        a[@answer.index(i)] = i
      else
        a[@answer.index(i)] = false
      end
    end
    return a
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
answer = gets.chomp.strip.downcase

game = Game.new(answer)

while !game.is_over
  puts "Please enter your guess word:"
  guess = gets.chomp.strip
  game.check_guess(guess)
  game.check_status
  game.feedback(guess)
end