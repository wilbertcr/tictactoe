require 'Tic_tac_toe.rb'

game = Tic_tac_toe.new()

game.display_game_instructions()

@first_Player = game.whos_first?()

game.display_board()

while game.check_winner() == -1 && !game.check_tie()
  if @first_Player == 1
    human_move = game.get_human_move()
    game.update_board("human",human_move)
    game.display_board()
    if game.check_winner() != -1 || game.check_tie()
      break
    end
    machine_move = game.get_machine_move()
    puts "#{machine_move+1}"
    game.update_board("machine",machine_move)
    game.display_board()
  else
    machine_move = game.get_machine_move()
    puts "#{machine_move+1}"
    game.update_board("machine",machine_move)
    game.display_board()
    if game.check_winner() != -1 || game.check_tie()
      break
    end
    human_move = game.get_human_move()
    game.update_board("human",human_move)
    game.display_board()
  end
end

if game.check_winner() == 1
  puts "Congratulations Human"
elsif game.check_winner() == 2
  puts "The machine won :("
else
  puts "Game was a tie"
end

