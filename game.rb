require_relative 'player'


## It should keep track of individual games including players
## It should have a method that checks to see if there is a winner
## it should output a question to the player
## it should keep track of who's turn it is (rand(1..2) then toggle)
## Player should be able to reset or quit game on end
class Game
  attr_accessor :p1, :p2
  def initialize (p1Name, p2Name)
    @p1 = Player.new(p1Name)
    @p2 = Player.new(p2Name)
    @turn = rand(1..2)
  end

  def toggleTurn()
    if @turn == 1
      @turn = 2
    else
      @turn = 1
    end
  end

  def game_over?()
    if @p1.lives == 0 || @p2.lives == 0
      true
    end
  end

  def winner()
    if @p1.lives == 0
      {name: @p2.name, lives: @p2.lives}
    elsif @p2.lives == 0
      {name: @p1.name, lives: @p1.lives}
    end
  end
end

