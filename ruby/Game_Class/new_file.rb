

class Team
  attr_accessor :wins

  def initialize(wins)
    @wins = wins
  end
end

team = Team.new(4)
team.wins = 10
puts team.wins
