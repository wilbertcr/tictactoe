class Board
  
  attr_accessor :getBoard
  
  def initialize()
    @getBoard = [0,0,0,0,0,0,0,0,0]
    @HUMAN = 1
    @MACHINE = 2
    @NO_WINNER_YET = -1

  end

  def update(player,position)
    if player == "human"
      @getBoard[position] = @HUMAN
    else 
      @getBoard[position] = @MACHINE
    end
  end
  
  def display(board=@getBoard,security=true)
    puts "-------------\n"
    puts "|#{symbol_display(board[0],security)}|#{symbol_display(board[1],security)}|#{symbol_display(board[2],security)}|\n"
    puts "-------------\n"
    puts "|#{symbol_display(board[3],security)}|#{symbol_display(board[4],security)}|#{symbol_display(board[5],security)}|\n"
    puts "-------------\n"
    puts "|#{symbol_display(board[6],security)}|#{symbol_display(board[7],security)}|#{symbol_display(board[8],security)}|\n"
    puts "-------------\n"
  end
  
  def isGameTied?(board)
    its_a_tie = true
    no_tie = false
    unless isBoardFull?(board)
      no_tie 
    else
      its_a_tie
    end
  
  end
  
  def get_winner(board)
    checks_matrix = [vertical_win(board), horizontal_win(board), diagonal_win(board)]
    winners = checks_matrix.rassoc(true)
    unless winners.nil?
      winners.first
    else
      @NO_WINNER_YET
    end
  end
    
  private
  
  def symbol_display(value,security_on=true)
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
  
  def isBoardFull?(board)
    return board.index(0) == nil
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
      return winner?(board,6)
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