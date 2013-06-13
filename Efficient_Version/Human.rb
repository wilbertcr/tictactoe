
class Human
  
  attr_accessor :identifier, :name

  @board
  @identifier
  @opponent_identifier

  def initialize(my_identifier,opponent_identifier)
    @identifier = my_identifier
    @opponent_identifier = opponent_identifier
    @name = "Human"
  end
  
  def get_move(board)
    @board = board
    move = 0
    while invalid_move?(move)
      puts "Please provide your move:"
      STDOUT.flush()
      move = gets.chomp.to_i
      puts "Incorrect input provided, please try again."  
    end
    move-1 #Array is 0...8, player's options are 1..9
  end
  
  private
  
  def invalid_move?(move)
    !(1..9).include?(move) || @board[move-1]!=0
  end

end