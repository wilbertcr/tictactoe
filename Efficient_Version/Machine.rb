class Machine
  attr_accessor :getMove, :identifier, :name
  
  @patternsMatrix
  @board
  @identifier
  @opponent_identifier

  def initialize(my_identifier,other_guy_identifier)
    @patternsMatrix = []
    @identifier = my_identifier
    @opponent_identifier = other_guy_identifier
    @name = "Hal"
  end
  
  def get_move(board)
    @board = board
    strategies_array = get_strategies_array()
    winning_strategy = strategies_array[0]  
    blocking_strategy = strategies_array[1]
    no_strategy = strategies_array[2]
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
  
  def get_strategies_array()
    @patternsMatrix = []
    find_vertical_pattern()
    find_horizontal_pattern()
    find_diagonal_pattern()
    get_first_available_move()
    return [@patternsMatrix.rassoc(@identifier),@patternsMatrix.rassoc(@opponent_identifier),@patternsMatrix.rassoc(-1)]
  end
  
  def find_vertical_pattern()
    top_position = 0; mid_position = 3; bottom_position = 6
    3.times do 
      checkLinesForPattern(top_position, mid_position, bottom_position)
      top_position +=1; mid_position +=1; bottom_position +=1
    end
  end
  
  def find_horizontal_pattern()
    left_position = 0; mid_position = 1; right_position = 2
    3.times do 
      checkLinesForPattern(left_position, mid_position, right_position)
      left_position +=3; mid_position +=3; right_position +=3
    end
  end

  def find_diagonal_pattern()
    first = 0 ; second = 4; third = 8
    2.times do 
      checkLinesForPattern(first, second, third)
      first = 2; third = 6
    end
  end  
  
  def get_first_available_move()
    if @board[4] == 0
      @patternsMatrix.push([4,-1])
    elsif @board[0] == 0
      @patternsMatrix.push([0,-1])
    elsif @board[2] == 0
      @patternsMatrix.push([2,-1])
    elsif @board[6] == 0
      @patternsMatrix.push([6,-1])
    elsif @board[8] == 0
      @patternsMatrix.push([8,-1])
    else
      random_generator = Random.new
      move = random_generator.rand(0..8)
      while @board[move] != 0
        move = rand.rand(0..8)
      end
      @patternsMatrix.push([move,-1])
    end 
  end

  def checkLinesForPattern(firstPosition, secondPosition, thirdPosition)
    if (@board[firstPosition] != 0 && @board[firstPosition]==@board[secondPosition] && 
      @board[thirdPosition]==0)
      @patternsMatrix.push([thirdPosition,@board[firstPosition]]) 
    elsif (@board[firstPosition] != 0 && @board[firstPosition]==@board[thirdPosition] && 
      @board[secondPosition]==0)
      @patternsMatrix.push([secondPosition,@board[firstPosition]])
    elsif (@board[secondPosition] != 0 && @board[secondPosition]==@board[thirdPosition] && 
      @board[firstPosition]==0)
      @patternsMatrix.push([firstPosition,@board[secondPosition]])
    end
  end
  
end