class Display
  
  @player1
  @player2
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def game_instructions()  
    puts "Goal:"
    puts ""
    puts "The goal of Tic Tac Toe is to be the first player to get"
    puts "three in a row on a 3x3 grid."
    puts ""
    puts "Instructions:"
    puts ""
    puts "In order to enter your move, please provide an integer between"
    puts "1 and 9, the numbers represent the positions in the board the"
    puts "following way:"
    puts "----------------\n"
    puts "|  1 |  2 |  3 |\n"
    puts "----------------\n"
    puts "|  4 |  5 |  6 |\n"
    puts "----------------\n"
    puts "|  7 |  8 |  9 |\n"
    puts "----------------\n"
  end
  
  def board(board,security=true)
    puts "-------------\n"
    puts "|#{board.cell_symbol(0)}|#{board.cell_symbol(1)}|#{board.cell_symbol(2)}|\n"
    puts "-------------\n"
    puts "|#{board.cell_symbol(3)}|#{board.cell_symbol(4)}|#{board.cell_symbol(5)}|\n"
    puts "-------------\n"
    puts "|#{board.cell_symbol(6)}|#{board.cell_symbol(7)}|#{board.cell_symbol(8)}|\n"
    puts "-------------\n"
  end
  
  def game_result(winner)
    if winner == @player1.id
      puts "Congratulations #{@player1.name}"
    elsif winner == @player2.id
      puts "Congratulations #{@player2.name}"
    else #Game is a tie
      puts "Game was a tie"
    end
  end

  def player_move(player,move)
    puts "#{player.name} move is: #{move+1}"
  end
  
end