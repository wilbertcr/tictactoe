require 'Tic_tac_toe_inefficient.rb'

HUMAN = 1
MACHINE = 2
NO_WINNER_YET = -1

game = Tic_tac_toe_inefficient.new()

game.display_game_instructions()

@first_Player = game.get_first_player()
@winner = game.check_winner()

game.display_board()

while @winner == NO_WINNER_YET && !game.check_tie()
  if @first_Player == HUMAN
    human_move = game.get_human_move()
    game.update_board("human",human_move)
    game.display_board()
    @winner = game.check_winner()
    if @winner != NO_WINNER_YET || game.check_tie()
      break
    end
    start_time = Time.now
    machine_move = game.get_machine_move()
    game.update_board("machine",machine_move)
    game.display_board()
    @winner = game.check_winner()
    end_time = Time.now
    puts "It took: #{end_time-start_time} seconds"
  else
    start_time = Time.now
    machine_move = game.get_machine_move()
    game.update_board("machine",machine_move)
    game.display_board()
    @winner = game.check_winner()
    end_time = Time.now
    puts "It took: #{end_time-start_time} seconds"
    if @winner != NO_WINNER_YET || game.check_tie()
      break
    end
    human_move = game.get_human_move()
    game.update_board("human",human_move)
    game.display_board()
    @winner = game.check_winner()
  end
end

if @winner == HUMAN
  puts "Congratulations Human"
elsif @winner == MACHINE
  puts "The machine won :("
else #Game is a tie
  puts "Game was a tie"
end
