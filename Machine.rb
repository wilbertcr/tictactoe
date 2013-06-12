class Machine
  attr_accessor :getMove
  
  @patternsMatrix
  
  def initialize()
    @patternsMatrix = []
  end
  
  def getMove(board) 
    strategiesArray = getStrategiesArray(board)
    winning_strategy = strategiesArray[0]  
    blocking_strategy = strategiesArray[1]
    no_strategy = strategiesArray[2]
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
  
  def getStrategiesArray(board)
    @patternsMatrix = []
    find_vertical_pattern(board)
    find_horizontal_pattern(board)
    find_diagonal_pattern(board)
    get_first_available_move(board)
    return [@patternsMatrix.rassoc(2),@patternsMatrix.rassoc(1),@patternsMatrix.rassoc(-1)]
  end
  
  def find_vertical_pattern(board)
    no_pattern_match_found = nil
    top_position = 0
    mid_position = 3
    bottom_position = 6
    3.times do 
      checkLinesForPattern(board,top_position, mid_position, bottom_position)
      #Moving to next column
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
      checkLinesForPattern(board,left_position, mid_position, right_position)
      #Moving to next line
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
      #Checking Diagonal 
      checkLinesForPattern(board,first, second, third)
      #Moving to antiDiagonal
      first = 2
      third = 6
    end
    return nil
  end  
  
  def checkLinesForPattern(board,firstPosition, secondPosition, thirdPosition)
    if    (board[firstPosition] != 0 && board[firstPosition]==board[secondPosition] && 
      board[thirdPosition]==0)
      @patternsMatrix.push([thirdPosition,board[firstPosition]]) 
    elsif (board[firstPosition] != 0 && board[firstPosition]==board[thirdPosition] && 
      board[secondPosition]==0)
      @patternsMatrix.push([secondPosition,board[firstPosition]])
    elsif (board[secondPosition] != 0 && board[secondPosition]==board[thirdPosition] && 
      board[firstPosition]==0)
      @patternsMatrix.push([firstPosition,board[secondPosition]])
    end
  end
  
  def get_first_available_move(board)
    unless board[4] == 0
      @patternsMatrix.push([board.index(0),-1])
    else
      @patternsMatrix.push([4,-1])
    end
  end

end