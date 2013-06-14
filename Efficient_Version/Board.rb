class Board
    
  @patterns_array
  Winner_not_found = -1
  
  def initialize()
    @board = [0,0,0,0,0,0,0,0,0]    
  end

  def empty_cell?(position)
    @board[position] == 0
  end
  
  def get_cell(position)
    @board[position]
  end
  
  def cell_symbol(position)
    value = get_cell(position)
    case value
    when 0
      "   "
    when 1
      " X "
    when 2
      " O "
    end
  end
  
  def set_cell(value, cell_position)
    @board[cell_position] = value
  end
  
  def cells_equal?(first_cell,second_cell)
    get_cell(first_cell)==get_cell(second_cell)
  end
    
  def game_tied?()
    return @board.index(0) == nil
  end
  
  def get_winner_id()
    @patterns_array = []
    check_patterns()
    winner = @patterns_array.first
    winner.nil? ? Winner_not_found : winner
  end

  private
  
  def check_patterns()
    check_vertical_pattern()
    check_horizontal_pattern()
    check_diagonal_pattern()
  end

  def check_vertical_pattern()
    top_cell = 0; center = 3; bottom_cell = 6;
    3.times do
      pattern_scanner(top_cell, center, bottom_cell)
      top_cell +=1; center +=1; bottom_cell +=1;
    end
  end  
  
  def check_horizontal_pattern()
    left_cell = 0; center = 1; right_cell = 2;
    3.times do
      pattern_scanner(left_cell, center, right_cell)
      left_cell +=3; center +=3; right_cell +=3;
    end
  end
  
  def check_diagonal_pattern()
    first_cell = 0; center = 4; last_cell = 8;
    2.times do
      pattern_scanner(first_cell, center, last_cell)
      first_cell = 2; last_cell = 6;
    end
  end    
  
  def pattern_scanner(first_cell, second_cell, third_cell)
    if (!empty_cell?(first_cell) && get_cell(first_cell) == get_cell(second_cell) && 
      get_cell(second_cell) == get_cell(third_cell))
      @patterns_array.push(get_cell(first_cell))  
    end
  end

end