class Game

  attr_reader :Player1,:Player2

  Winner_not_found = -1
  
  def initialize(player1, player2)
    @Player1 = player1
    @Player2 = player2
    @Board = Board.new()
    @Display = Display.new(@Player1,@Player2)
    @current_player = @Player1
  end

  def play()
    @Display.game_instructions() 
    while !@Board.game_over?
      play_turn()
      update_current_player
    end
    @Display.game_result(@Board.get_winner_id)
  end

  private
  
  def play_turn()
    player_move = @current_player.get_move(@Board)
    @Display.player_move(@current_player,player_move)
    update_and_display_board(@current_player.id, player_move)
  end

  def update_current_player()
    @current_player = (@current_player == @Player1) ? @Player2 : @Player1
  end  
  
  def update_and_display_board(player,move)
    @Board.set_cell(player,move)
    @Display.board(@Board)
  end
          
end

