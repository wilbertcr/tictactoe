require "./Efficient_Version/Board.rb"
require "./Efficient_Version/Players.rb"
require "./Efficient_Version/Display.rb"
require "./Efficient_Version/Human.rb"
require "./Efficient_Version/Machine.rb"

class Game

  attr_reader :Player1,:Player2
  @Player1
  @Player2
  Winner_not_found = -1
  
  def initialize()
    @Player1 = Players.human(2,1)
    @Player1.name= "Hal 1"
    @Player2 = Players.machine(1,2)
    @Player2.name= "Hal 2"
    @Board = Board.new()
    @Display = Display.new(@Player1,@Player2)
  end

  def play()
    run_pre_game_routine()
    while !game_over?
        player1_turn()
        update_winner_value
        if game_over?
          break
        end
        player2_turn()
        update_winner_value
    end
    @Display.game_result(@winner)
  end

  private
  
  def update_winner_value()
    @winner = @Board.check_board_for_winner(@Board.get_board)
  end
    
  def run_pre_game_routine()
    @Display.game_instructions()
    @winner = @Board.check_board_for_winner(@Board.get_board)    
  end

  def game_over?()
    return @winner != Winner_not_found || @Board.game_tied?(@Board.get_board)
  end 

  def player1_turn()
    player1_move = @Player1.get_move(@Board.get_board)
    @Display.player_move(@Player1,player1_move)
    update_and_display_board(@Player1.identifier, player1_move)
  end
      
  def player2_turn()
    player2_move = @Player2.get_move(@Board.get_board)
    @Display.player_move(@Player2,player2_move)
    update_and_display_board(@Player2.identifier, player2_move)
  end
  
  def update_and_display_board(player,move)
    @Board.update(player,move)
    @Display.board(@Board.get_board)
  end
          
end

session = Game.new
session.play()