require './Constants.rb'

class Board
  
  attr_accessor :getBoard
  
  Constants.HUMAN = 1
  Constants.MACHINE = 2
  Constants.OTHER = -1
  
  def initialize()
    @getBoard = [0,0,0,0,0,0,0,0,0]
  end

  def update(player,position)
    player == "human" ? @getBoard[position] = Constants.HUMAN : @getBoard[position] = Constants.MACHINE 
  end
    
  def game_tied?(board)
    return board_full?(board)
  end
    
  def board_full?(board)
    return board.index(0) == nil
  end
  
  def check_board_for_winner(board)
    checks_matrix = [vertical_win(board), horizontal_win(board), diagonal_win(board)]
    winners = checks_matrix.rassoc(true)
    winners.nil? ? Constants.OTHER : winners.first
  end
    
  private

  def vertical_win(board)
    winner_not_found = false
    if (board[0]==board[3] && board[3]==board[6] && board[6] != 0)
      return get_winner(board,6)
    elsif (board[1]==board[4] && board[4]==board[7] && board[7] != 0)
      return get_winner(board,7)
    elsif (board[2]==board[5] && board[5]==board[8] && board[8] != 0)
      return get_winner(board,8)
    else
      return [0,winner_not_found]
    end
  end  
  
  def horizontal_win(board)
    winner_not_found = false
    if (board[0]==board[1] && board[1]==board[2] && board[2] != 0)
      return get_winner(board,2)
    elsif (board[3]==board[4] && board[4]==board[5] && board[5] != 0)
      return get_winner(board,5)
    elsif (board[6]==board[7] && board[7]==board[8] && board[8] != 0)
      return get_winner(board,8)
    else
      return [0,winner_not_found]
    end
  end
  
  def diagonal_win(board)
    winner_not_found = false
    if (board[0]==board[4] && board[4]==board[8] && board[8] != 0)
      return get_winner(board,8)
    elsif (board[2]==board[4] && board[4]==board[6] && board[6] != 0)
      return get_winner(board,6)
    else 
      return [0,winner_not_found]
    end
  end    
  
  def get_winner(board,position)
    human_won = 1
    machine_won = 2
    winner_found = true
    winner_not_found = false
    if board[position] == Constants.HUMAN
      return [human_won,winner_found]
    elsif board[position] == Constants.MACHINE
      return [machine_won,winner_found]
    else
      return[0,winner_not_found]
    end
  end

end