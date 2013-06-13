require './Constants.rb'

class Board
  
  attr_accessor :getBoard
  
  @patternsCheck
  
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
    @patternsCheck = []
    check_patterns()
    winners = @patternCheck.first
    winners.nil? ? Constants.OTHER : winners
  end

  private
  
  def check_patterns()
    check_vertical_pattern()
    check_horizontal_pattern()
    check_diagonal_pattern()
  end

  def check_vertical_pattern()
    top_cell = 0, center = 3, bottom_cell = 6
    3.times do
      patternScanner(leftPosition, center, rightPosition)
      top_cell +=1; center +=1; bottom_cell +=1;
    end
  end  
  
  def check_horizontal_pattern()
    left_cell = 0, center = 1, right_cell = 2
    3.times do
      patternScanner(leftPosition, center, rightPosition)
      left_cell +=3; center +=3; right_cell +=3;
    end
  end
  
  def check_diagonal_pattern()
    first_cell = 0, center = 4, last_cell = 8
    2.times do
      patternsScanner(first_cell, center, last_cell)
      first_cell = 2; last_cell = 6;
    end
  end    
  
  def patternScanner(firstCell, secondCell, thirdCell)
    if (@getBoard[firstCell] != 0 && @getBoard[firstCell]==@getBoard[secondCell] &&
        @getBoard[secondCell]==@getBoard[thirdCell])
      @patternsCheck.push(@getBoard[firstCell])  
    end
  end
  
end