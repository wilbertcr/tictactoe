require "./Board.rb"
require "./Players.rb"

class Tic_tac_toe
  
  def initialize()
    @Players = Players.new
    @Board = Board.new()
    @HUMAN = 1
    @MACHINE = 2
    @NO_WINNER_YET = -1
  end

  def play()
    game = Tic_tac_toe.new()
    game.display_game_instructions()
    @first_Player = game.get_first_player()
    @winner = @Board.get_winner(@Board.getBoard)
    @Board.display()
    puts "First one:#{game.gameIsNotOver}"
    puts "Second one:#{(@winner == @NO_WINNER_YET && !@Board.isGameTied?(@Board.getBoard))}"
    while @winner == @NO_WINNER_YET && !@Board.isGameTied?(@Board.getBoard)
      if @first_Player == @HUMAN
        human_move = @Players.human.getMove(@Board.getBoard)
        @Board.update("human",human_move)
        @Board.display()
        @winner = @Board.get_winner(@Board.getBoard)
        if @winner != @NO_WINNER_YET || @Board.isGameTied?(@Board.getBoard)
          break
        end
        machine_move = @Players.machine.getMove(@Board.getBoard)
        @Board.update("machine",machine_move)
        @Board.display()
        @winner = @Board.get_winner(@Board.getBoard)
      else
        machine_move = @Players.machine.getMove(@Board.getBoard)
        @Board.update("machine",machine_move)
        @Board.display()
        @winner = @Board.get_winner()
        end_time = Time.now
        if @winner != @NO_WINNER_YET || @Board.isGameTied?(@Board.getBoard)
          break
        end
        human_move = @Players.human.getMove(@Board.getBoard)
        @Board.update("human",human_move)
        @Board.display()
        @winner = @Board.get_winner()
      end
    end
    
    if @winner == @HUMAN
      puts "Congratulations Human"
    elsif @winner == @MACHINE
      puts "The machine won :("
    else #Game is a tie
      puts "Game was a tie"
    end
  end
  
  def gameIsNotOver()
    return (@winner == @NO_WINNER_YET && !@Board.isGameTied?(@Board.getBoard))
  end
  
  def gameIsOver()
    return (@winner != @NO_WINNER_YET || @Board.isGameTied?(@Board.getBoard))
  end
    
  def display_game_instructions()  
    puts "Goal:"
    puts ""
    puts "The goal of Tic Tac Toe is to be the first player to get"
    puts "three in a row on a 3x3 grid."
    puts ""
    puts "Instructions:"
    puts ""
    puts "In order to enter your move, please provide an integer between"
    puts "1 and 9, the numbers represent the positions in the board the"
    puts "following way:"
    @Board.display([1,2,3,4,5,6,7,8,9],false)
  end
  
   
  def get_first_player()
    human_first = 1
    machine_first = 2
    player = nil
    @option = " "    
    while inputIsIncorrect()
      puts "Would you like to go first, or to have the machine go first? (y/n)"
      STDOUT.flush()
      @option = gets.chomp.downcase 
      if @option == "y"
        player = human_first
      elsif @option == "n"
        player = machine_first
      else
        puts "Sorry, its either 'y' or 'n'" 
      end 
    end
    player
  end
  
  def inputIsIncorrect()
    return @option != "y" && @option !="n"
  end

end
