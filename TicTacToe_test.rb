require 'Tic_tac_toe.rb'


tictactest = Tic_tac_toe.new()


#tictactest.display_board()
#tictactest.display_game_instructions()
#tictactest.whos_first?()
#tictactest.get_human_move()
puts "Checking horizontal"
puts "#{tictactest.check_winner([1,1,1,0,0,0,0,0,0])}"
puts "#{tictactest.check_winner([0,0,0,1,1,1,0,0,0])}"
puts "#{tictactest.check_winner([0,0,0,0,0,0,1,1,1])}"

puts "#{tictactest.check_winner([2,2,2,0,0,0,0,0,0])}"
puts "#{tictactest.check_winner([0,0,0,2,2,2,0,0,0])}"
puts "#{tictactest.check_winner([0,0,0,0,0,0,2,2,2])}"

puts "Checking diagonal"
puts "#{tictactest.check_winner([1,0,0,0,1,0,0,0,1])}"
puts "#{tictactest.check_winner([0,0,1,0,1,0,1,0,0])}"

puts "#{tictactest.check_winner([2,0,0,0,2,0,0,0,2])}"
puts "#{tictactest.check_winner([0,0,2,0,2,0,2,0,0])}"

puts "Checking vertical"
puts "#{tictactest.check_winner([1,0,0,1,0,0,1,0,0])}"
puts "#{tictactest.check_winner([0,1,0,0,1,0,0,1,0])}"
puts "#{tictactest.check_winner([0,0,1,0,0,1,0,0,1])}"

puts "#{tictactest.check_winner([2,0,0,2,0,0,2,0,0])}"
puts "#{tictactest.check_winner([0,2,0,0,2,0,0,2,0])}"
puts "#{tictactest.check_winner([0,0,2,0,0,2,0,0,2])}"

puts "#{tictactest.check_tie([0,0,2,0,0,2,0,0,2])}"

tictactest.get_human_move()