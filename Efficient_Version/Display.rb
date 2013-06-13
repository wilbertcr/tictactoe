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
    board([1,2,3,4,5,6,7,8,9],false)
  end
  
  def board(board,security=true)
    puts "-------------\n"
    puts "|#{get_symbol(board[0],security)}|#{get_symbol(board[1],security)}|#{get_symbol(board[2],security)}|\n"
    puts "-------------\n"
    puts "|#{get_symbol(board[3],security)}|#{get_symbol(board[4],security)}|#{get_symbol(board[5],security)}|\n"
    puts "-------------\n"
    puts "|#{get_symbol(board[6],security)}|#{get_symbol(board[7],security)}|#{get_symbol(board[8],security)}|\n"
    puts "-------------\n"
  end
  
  def game_result(winner)
    if winner == @player1.identifier
      puts "Congratulations #{@player1.name}"
    elsif winner == @player2.identifier
      puts "Congratulations #{@player2.name}"
    else #Game is a tie
      puts "Game was a tie"
    end
  end

  def player_move(player,move)
    puts "#{player.name} move is: #{move+1}"
  end
  
  private 
  
  def get_symbol(value,security_on=true)
    if security_on
      case value
      when 0
        "   "
      when 1
        " X "
      when 2
        " O "
      else
        puts "symbol_display method on Tic_tac_toe class has"
        puts "received an incorrect value. Only 0,1 or 2 are"
        puts "allowed."
      end
    else
      return " #{value} "
    end
  end
  
end