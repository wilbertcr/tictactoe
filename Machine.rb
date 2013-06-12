class Machine
  attr_accessor :getMove
  
  def initialize()
  end
  
  def getMove(board)
    patterns_matrix = [find_vertical_pattern(board),find_horizontal_pattern(board),find_diagonal_pattern(board)]
    winning_strategy = patterns_matrix.rassoc(2)
    blocking_strategy = patterns_matrix.rassoc(1)
    no_strategy = get_first_available_move(board)
    move = winning_strategy     
    if move.nil?
      move = blocking_strategy
      if move.nil?
        move = no_strategy
      end
    end
    move.first
  end  
  
  
  private
  
  def find_vertical_pattern(board)
    no_pattern_match_found = nil
    top_position = 0
    mid_position = 3
    bottom_position = 6
    3.times do 
      if    (board[top_position] != 0 && board[top_position]==board[mid_position] && 
        board[bottom_position]==0)
        return [bottom_position,board[top_position]]
      elsif (board[top_position] != 0 && board[top_position]==board[bottom_position] && 
        board[mid_position]==0)
        return [mid_position,board[top_position]]
      elsif (board[mid_position] != 0 && board[mid_position]==board[bottom_position] && 
        board[top_position]==0)
        return [top_position,board[mid_position]]
      end
      #Moves to next column
      top_position +=1
      mid_position +=1
      bottom_position +=1
    end
    return no_pattern_match_found
  end
  
  def find_horizontal_pattern(board)
    no_pattern_match_found = nil
    left_position = 0
    mid_position = 1
    right_position = 2
    3.times do 
      if (board[left_position] != 0 && 
        board[left_position]==board[mid_position] && 
        board[right_position]==0)
        return [right_position,board[left_position]]
      elsif (board[left_position] != 0 && 
        board[left_position]==board[right_position] && 
        board[mid_position]==0)
        return [mid_position,board[left_position]]
      elsif (board[mid_position] != 0 && 
        board[mid_position]==board[right_position] && 
        board[left_position]==0)
        return [left_position,board[mid_position]]
      end
      #Moves to next line
      left_position +=3
      mid_position +=3
      right_position +=3
    end
    return no_pattern_match_found
  end
  
  def find_diagonal_pattern(board)
    first = 0
    second = 4
    third = 8
    #Diagonals
    2.times do 
     if board[first] != 0 && board[first]==board[second] && 
       board[third]==0
       return [third,board[first]]
     elsif board[first] != 0 && board[first]==board[third] && 
       board[second]==0
       return [second,board[first]]
     elsif board[third] != 0 && board[second]==board[third] && 
       board[first]==0
       return [first,board[second]]
     end
      first = 2
      third = 6
    end
    return nil
  end  
  
  def get_first_available_move(board)
    unless board[4] == 0
      move = [board.index(0),nil]
    else
      move = [4,nil]
    end
    move
  end

end