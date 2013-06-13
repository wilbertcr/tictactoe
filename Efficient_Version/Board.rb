
class Board
  
  attr_accessor :get_board
  
  @patterns_array
  Winner_not_found = -1
  
  def initialize()
    @get_board = [0,0,0,0,0,0,0,0,0]    
  end

  def update(player_identifier ,position)
    @get_board[position] = player_identifier 
  end
    
  def game_tied?(board)
    return board_full?(board)
  end
    
  def board_full?(board)
    return board.index(0) == nil
  end
  
  def check_board_for_winner(board)
    @patterns_array = []
    check_patterns()
    winners = @patterns_array.first
    winners.nil? ? Winner_not_found : winners
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
    if (@get_board[first_cell] != 0 && @get_board[first_cell] == @get_board[second_cell] && 
      @get_board[second_cell] == @get_board[third_cell])
      @patterns_array.push(@get_board[first_cell])  
    end
  end
  
end