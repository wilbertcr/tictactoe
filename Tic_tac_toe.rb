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
    runPreGameRoutine()
    while gameIsNotOver
      if @first_Player == @HUMAN
        doHumanTurn()
        updateWinnerValue
        if gameIsOver
          break
        end
        doMachineTurn()
        updateWinnerValue
      else
        doMachineTurn()
        updateWinnerValue
        if gameIsOver
          break
        end
        doHumanTurn()
      end
    end
    
    displayGameResult(@winner)
  end

  private
  
  def updateWinnerValue()
    @winner = @Board.get_winner(@Board.getBoard)
  end
    
  def runPreGameRoutine()
    display_game_instructions()
    @first_Player = get_first_player()
    @winner = @Board.get_winner(@Board.getBoard)
    @Board.display()    
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

  def gameIsNotOver()
    return @winner == @NO_WINNER_YET && !@Board.isGameTied?(@Board.getBoard)
  end 
  
  def gameIsOver()
    return @winner != @NO_WINNER_YET || @Board.isGameTied?(@Board.getBoard)
  end
  
  def doMachineTurn()
    machine_move = @Players.machine.getMove(@Board.getBoard)
    puts "Machine move is: #{machine_move+1}"
    updateAndDisplayBoard("machine", machine_move)
  end
  
  def doHumanTurn()
    human_move = @Players.human.getMove(@Board.getBoard)
    updateAndDisplayBoard("human", human_move)
  end
  
  def updateAndDisplayBoard(player,move)
    @Board.update(player,move)
    @Board.display()
  end
  
  def displayGameResult(winner)
    if winner == @HUMAN
          puts "Congratulations Human"
        elsif winner == @MACHINE
          puts "The machine won :("
        else #Game is a tie
          puts "Game was a tie"
    end
  end
        
end
