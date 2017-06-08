# 8.5 Combining SQL and Ruby

# Release 0: Pseudocode
# Overall concept: Create a game, "Symbol Crush", with the objective of making combinations of 3 of a kind to rack up points!
# Possible variables: change size of grid based on user input, change difficulty setting (# of diff symbols) based on user input

# Release 1: Create db + table for each game
# Start by making basic 5x5 grid, populate with 4 random symbols

require 'sqlite3'

class Game
  attr_reader :grid

  def initialize(grid_width, grid_length, difficulty)
    @grid = []
    @cols = grid_width
    @rows = grid_length
    @difficulty = difficulty
    @points_total = 0
    @is_over = nil
  end

  def grid_check
    if @cols< 3 || @rows < 3
      puts "Your grid dimensions are too small, try again. (Miniumn size is 3 x 3)"
      false
    end
    true
  end

  def populate_grid
    @rows.times do
      row = []
      @cols.times do 
        row << random_symbol(@difficulty)
      end
      @grid << row
    end
  end

  def invalid_move(row, col, direction)
    if direction != "up" || direction != "down" || direction != "left" || direction != "right"
      puts "Not a valid direction, try again. (up, down, left, or right)"
    end
    error = "Not a valid move, try again."
    if row == 1 && direction == "up"
      puts error
    elsif row == @rows && direction == "down"
      puts error
    elsif col == 1 && direction == "left"
      puts error
    elsif col == @cols && direction == "right"
      puts error
    end
    true
  end

  def is_valid_move(row, col, direction)
  end

  def make_move(row, col, direction)
  end

  def combo
  end

  def game_over
  end
end

def random_symbol(int)
  str = "@#$%&"
  a = rand(int)
  return str[a]
end

game1 = Game.new(5, 5, 4)
game1.populate_grid
game1.grid.each do |row|
  p row
end


db = SQLite3::Database.new("game.db")
db.results_as_hash = true

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS game (
    id INTEGER PRIMARY KEY,
    col1 INT,
    col2 INT,
    col3 INT,
    col4 INT,
    col5 INT
  )
SQL

db.execute(create_table_cmd)
game = db.execute("SELECT * FROM game")
#db.execute("INSERT INTO game (col1, col2, col3, col4, col5) VALUES ()")

game = db.execute("SELECT * FROM game")