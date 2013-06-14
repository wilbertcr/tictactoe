class Machine

  attr_accessor :name
  attr_reader :id
  
  @patternsMatrix
  @board
  @id
  @opponent_id

  def initialize(my_id,opponent_id)
    @patternsMatrix = []
    @id = my_id
    @opponent_id = opponent_id
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
    return [@patternsMatrix.rassoc(@id),@patternsMatrix.rassoc(@opponent_id),@patternsMatrix.rassoc(-1)]
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
    if @board.empty_cell?(4)
      @patternsMatrix.push([4,-1])
    elsif @board.empty_cell?(0)
      @patternsMatrix.push([0,-1])
    elsif @board.empty_cell?(2)
      @patternsMatrix.push([2,-1])
    elsif @board.empty_cell?(6)
      @patternsMatrix.push([6,-1])
    elsif @board.empty_cell?(8)
      @patternsMatrix.push([8,-1])
    else
      random_generator = Random.new
      move = random_generator.rand(0..8)
      while !@board.empty_cell?(move)
        move = random_generator.rand(0..8)
      end
      @patternsMatrix.push([move,-1])
    end 
  end

  def checkLinesForPattern(first_position, second_position, third_position)
    if (!@board.empty_cell?(first_position) && @board.cells_equal?(first_position,second_position) && 
      @board.empty_cell?(third_position))
      @patternsMatrix.push([third_position,@board.get_cell(first_position)]) 
    elsif (!@board.empty_cell?(first_position) && @board.cells_equal?(first_position,third_position) && 
      @board.empty_cell?(second_position))
      @patternsMatrix.push([second_position,@board.get_cell(first_position)])
    elsif (!@board.empty_cell?(second_position) &&  @board.cells_equal?(second_position,third_position) && 
      @board.empty_cell?(first_position))
      @patternsMatrix.push([first_position,@board.get_cell(second_position)])
    end
  end

end
