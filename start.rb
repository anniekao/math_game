require_relative 'game'
require_relative 'player'

def checkAnswer(num1, num2, answer)
  solution = num1 + num2
  if solution == answer
    true
  else
    false
  end
end

def start 
  puts ""
  puts " ======  Welcome to the Ruby Math-a-thon ====== "
  puts "Please enter player one's name: "
  p1Name = gets.chomp
  puts "Please enter player two's name: "
  p2Name = gets.chomp
  game = Game.new(p1Name, p2Name)
  puts "#{game.p1.name} VS. #{game.p2.name}"

  current_player = game.toggleTurn

  while game.game_over? != true do
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts ""
    puts "---------NEW TURN----------"
    if current_player == 1
      puts "#{game.p1.name}: What is #{num1} plus #{num2}?"
      answer = gets.chomp.to_i
      correct = checkAnswer(num1, num2, answer)
      if correct == true
        puts "#{game.p1.name}: YES! You are correct"
        current_player = game.toggleTurn
      else 
        puts "#{game.p1.name}: What, seriously?! No."
        puts "The answer is #{num1 + num2}"
        current_player = game.toggleTurn
        game.p1.deduct_life()
      end
    else
      puts "#{game.p2.name}: What is #{num1} plus #{num2}?"
      answer = gets.chomp.to_i
      correct = checkAnswer(num1, num2, answer)
      if correct == true
        puts "#{game.p2.name}: You are correct!"
        current_player = game.toggleTurn
      else 
        puts "#{game.p2.name}: Sorry, you got it wrong!"
        puts "The answer is #{num1 + num2}"
        current_player = game.toggleTurn
        game.p2.deduct_life()
      end
    end
    puts "#{game.p1.name}: #{game.p1.lives}/3 VS. #{game.p2.name}: #{game.p2.lives}/3"
  end

  winner = game.winner()
  puts ""
  puts "---------GAME OVER----------"
  puts "#{winner[:name]} won with a score of #{winner[:lives]}/3"
end

start()


