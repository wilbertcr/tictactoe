
class Human
  
  attr_accessor :name
  attr_reader :id

  @board
  @id
  @opponent_identifier

  def initialize(my_id,opponent_id)
    @id = my_id
    @opponent_id = opponent_id
    @name = "Human"
  end
  
  def get_move(board)
    @board = board
    move = 0
    while invalid_move?(move)
      puts "Please provide your move:"
      STDOUT.flush()
      move = gets.chomp.to_i
      if invalid_move?(move)
        puts "Incorrect input provided, please try again."
      end
    end
    move-1 #Array is 0...8, human player's options are 1..9
  end

  private
  
  def invalid_move?(move)
    !(1..9).include?(move) || !@board.empty_cell?(move-1)
  end

end