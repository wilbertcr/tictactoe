require 'Tic_tac_toe.rb'

tictactest = Tic_tac_toe.new()


#tictactest.display_board()
#tictactest.display_game_instructions()
#tictactest.whos_first?()
#tictactest.get_human_move()
puts "#{tictactest.check_winner([1,1,1,0,0,0,0,0,0])}"
