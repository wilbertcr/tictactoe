
class Human
  
  attr_accessor :getMove, :identifier, :name

  @board
  @identifier
  @opponent_identifier

  def initialize(my_identifier,opponent_identifier)
    @identifier = my_identifier
    @opponent_identifier = opponent_identifier
    @name = "Human"
  end
  
  def get_move(board)
    move = 0
    while move_is_outside_board(move) || desired_move_taken(board,move)
      puts "Please provide your move:"
      STDOUT.flush()
      move = gets.chomp.to_i
      if move_is_outside_board(move)
        puts "Sorry, only numbers between 1 and 9"
      elsif desired_move_taken(board,move)
        puts "Sorry, that position is taken"
      end  
    end
    move-1 #Array is 0...8, player's options are 1..9
  end
  
  private
  
  def move_is_outside_board(move)
    return !(1..9).include?(move)
  end
  
  def desired_move_taken(board,move)
    return board[move-1]!=0
  end

end