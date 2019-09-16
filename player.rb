## To keep track of player's name, points and lives
## It should set the player's name, subtract a life from the
## player's lives when the player loses
class Player 
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def deduct_life
    @lives -= 1
  end
end

