require "./Board.rb"
require "./Constants.rb"
require "./Players.rb"
require "./Display.rb"

class Game

  def initialize()
    @Player1 = Players.human
    @Player2 = Players.machine
    @Board = Board.new()
  end

  def play()
    run_pre_game_routine()
    while !game_over?
      if @first_Player == Constants.HUMAN
        human_turn()
        update_winner_value
        if game_over?
          break
        end
        machine_turn()
        update_winner_value
      else
        machine_turn()
        update_winner_value
        if game_over?
          break
        end
        human_turn()
        update_winner_value
      end
    end
    Display.game_result(@winner)
  end

  private
  
  def update_winner_value()
    @winner = @Board.check_board_for_winner(@Board.getBoard)
  end
    
  def run_pre_game_routine()
    Display.game_instructions()
    @first_Player = get_first_player()
    @winner = @Board.check_board_for_winner(@Board.getBoard)
    Display.board(@Board.getBoard)    
  end

  def get_first_player()
    player = nil
    @option = " "    
    while !correct_input?()
      puts "Would you like to go first, or to have the machine go first? (y/n)"
      STDOUT.flush()
      @option = gets.chomp.downcase 
      if @option == "y"
        player = Constants.HUMAN
      elsif @option == "n"
        player = Constants.MACHINE
      else
        puts "Sorry, its either 'y' or 'n'" 
      end 
    end
    player
  end

  def correct_input?()
    return @option == "y" || @option =="n"
  end

  def game_over?()
    return @winner != Constants.OTHER || @Board.game_tied?(@Board.getBoard)
  end 
    
  def machine_turn()
    machine_move = @Players.machine.getMove(@Board.getBoard)
    puts "Machine move is: #{machine_move+1}"
    update_and_display_board("machine", machine_move)
  end
  
  def human_turn()
    human_move = @Players.human.getMove(@Board.getBoard)
    update_and_display_board("human", human_move)
  end
  
  def update_and_display_board(player,move)
    @Board.update(player,move)
    Display.board(@Board.getBoard)
  end
          
end

Game = Game.new()
Game.play()
