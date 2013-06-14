require "./Efficient_Version/Board.rb"
require "./Efficient_Version/Players.rb"
require "./Efficient_Version/Display.rb"
require "./Efficient_Version/Human.rb"
require "./Efficient_Version/Machine.rb"

class Game

  attr_reader :Player1,:Player2

  Winner_not_found = -1
  
  def initialize(player1, player2)
    @Player1 = player1
    @Player2 = player2
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
    @winner = @Board.get_winner_id()
  end
    
  def run_pre_game_routine()
    @Display.game_instructions()
    @winner = @Board.get_winner_id()    
  end

  def game_over?()
    return @winner != Winner_not_found || @Board.game_tied?()
  end 

  def player1_turn()
    player1_move = @Player1.get_move(@Board)
    @Display.player_move(@Player1,player1_move)
    update_and_display_board(@Player1.id, player1_move)
  end
      
  def player2_turn()
    move = @Player2.get_move(@Board)
    @Display.player_move(@Player2,move)
    update_and_display_board(@Player2.id, move)
  end
  
  def update_and_display_board(player,move)
    @Board.set_cell(player,move)
    @Display.board(@Board)
  end
          
end

first_player = Players.machine(1,2)
first_player.name=("Hal")
second_player = Players.human(2,1)
second_player.name=("Wilbert")

session = Game.new(first_player,second_player)
session.play()