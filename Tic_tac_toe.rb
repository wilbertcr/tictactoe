class Tic_tac_toe
  attr_reader :board
  
  def initialize()
    @board = [0,0,0,0,0,0,0,0,0]
  end

  def display_game_instructions()  
    puts "Goal:"
    puts ""
    puts "The goal of Tic Tac Toe is to be the first player to get"
    puts "three in a row on a 3x3 grid."
    puts ""
    puts "In order to enter your move, please provide an integer between"
    puts "1 and 9, the numbers represent the positions in the board the"
    puts "following way:"
    display_board([1,2,3,4,5,6,7,8,9],false)
  end
  
  def display_board(board=@board,security=true)
    puts "-------------\n"
    puts "|#{symbol_display(board[0],security)}|#{symbol_display(board[1],security)}|#{symbol_display(board[2],security)}|\n"
    puts "-------------\n"
    puts "|#{symbol_display(board[3],security)}|#{symbol_display(board[4],security)}|#{symbol_display(board[5],security)}|\n"
    puts "-------------\n"
    puts "|#{symbol_display(board[6],security)}|#{symbol_display(board[7],security)}|#{symbol_display(board[8],security)}|\n"
    puts "-------------\n"
  end
  
  def whos_first? ()
    human_first = 1
    machine_first = 2
    puts "Would you like to go first, or to have the machine go first? (y/n)"
    STDOUT.flush()
    option = gets.chomp.downcase
    return human_first unless option == "n"
      return machine_first
  end
  
  def get_human_move()
    move = 0
    puts "Please provide your move:"
    STDOUT.flush()
    move = gets.chomp.to_i
    if !(1..9).include?(move)
      puts "Sorry, only numbers between 1 and 9"
      self.get_human_move()
    end
    move
  end
  
  
  def symbol_display(value,security=true)
    if security
      
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
  
  def check_winner(board=@board)
    checks_matrix = [vertical_win(board), horizontal_win(board), diagonal_win(board)]
    puts "#{checks_matrix}"
    winners = checks_matrix.rassoc(true)
    if winners==nil
      return false
    else
      return winners[0]
    end
  end
  
  def vertical_win(board)
    winner_not_found = false
    if (board[0]==board[3] && board[3]==board[6] && board[6] != 0)
      return winner?(board,6)
    elsif (board[1]==board[4] && board[4]==board[7] && board[7] != 0)
      return winner?(board,7)
    elsif (board[2]==board[5] && board[5]==board[8] && board[8] != 0)
      return winner?(board,8)
    else
      return [0,winner_not_found]
    end
  end  
  
  def horizontal_win(board)
    winner_not_found = false
    if (board[0]==board[1] && board[1]==board[2] && board[2] != 0)
      puts "#{board[0]},#{board[1]},#{board[2]}"
      return winner?(board,2)
    elsif (board[3]==board[4] && board[4]==board[5] && board[5] != 0)
      return winner?(board,5)
    elsif (board[6]==board[7] && board[7]==board[8] && board[8] != 0)
      return winner?(board,8)
    else
      return [0,winner_not_found]
    end
  end

  def diagonal_win(board)
    winner_not_found = false
    if (board[0]==board[4] && board[4]==board[8] && board[8] != 0)
      return winner?(board,8)
    elsif (board[2]==board[4] && board[4]==board[6] && board[6] != 0)
      return winner?(board,5)
    else 
      return [0,winner_not_found]
    end
  end  
  
  
  def winner?(board,position)
    human_won = 1
    machine_won = 2
    winner_found = true
    winner_not_found = false
    if board[position] == human_won
      return [human_won,winner_found]
    elsif board[position] == machine_won
      return [machine_won,winner_found]
    else
      return[0,winner_not_found]
    end
  end
  

end