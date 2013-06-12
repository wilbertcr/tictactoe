require_relative './Players.rb'

class Human
  
  attr_accessor :getMove
  
  def initialize()
    
  end
  
  def getMove(board)
    move = 0
    while moveIsOutsideBoard(move) || desiredMoveIsTaken(board,move)
      puts "Please provide your move:"
      STDOUT.flush()
      move = gets.chomp.to_i
      if moveIsOutsideBoard(move)
        puts "Sorry, only numbers between 1 and 9"
      elsif desiredMoveIsTaken(board,move)
        puts "Sorry, that position is taken"
      end  
    end
    move-1 #Array is 0...8, player's options are 1..9
  end
  
  private
  
  def moveIsOutsideBoard(move)
    return !(1..9).include?(move)
  end
  
  def desiredMoveIsTaken(board,move)
    return board[move-1]!=0
  end

end