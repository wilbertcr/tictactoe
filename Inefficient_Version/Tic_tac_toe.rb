class Tic_tac_toe
  
  module Patterns
      Winning =
        [[(/220....../),2],[(/202....../),1],[(/022....../),0],
         [(/...220.../),5],[(/...202.../),4],[(/...022.../),3],
         [(/......220/),8],[(/......202/),7],[(/......022/),6],
         [(/2..2..0../),6],[(/2..0..2../),3],[(/0..2..2../),0],
         [(/.2..2..0./),7],[(/.2..0..2./),4],[(/.0..2..2./),1],
         [(/..2..2..0/),8],[(/..2..0..2/),5],[(/..0..2..2/),2],
         [(/2...2...0/),8],[(/2...0...2/),4],[(/0...2...2/),0],
         [(/..2.2.0../),6],[(/..2.0.2../),4],[(/..0.2.2../),2]]
      Blocking =
        [[(/110....../),2],[(/101....../),1],[(/011....../),0],
         [(/...110.../),5],[(/...101.../),4],[(/...011.../),3],
         [(/......110/),8],[(/......101/),7],[(/......011/),6],
         [(/1..1..0../),6],[(/1..0..1../),3],[(/0..1..1../),0],
         [(/.1..1..0./),7],[(/.1..0..1./),4],[(/.0..1..1./),1],
         [(/..1..1..0/),8],[(/..1..0..1/),5],[(/..0..1..1/),2],
         [(/1...1...0/),8],[(/1...0...1/),4],[(/0...1...1/),0],
         [(/..1.1.0../),6],[(/..1.0.1../),4],[(/..0.1.1../),2]]
      Won =
        [[(/111....../),1],[(/...111.../),1],[(/......111/),1],
         [(/1..1..1../),1],[(/.1..1..1./),1],[(/..1..1..1/),1],
         [(/1...1...1/),1],[(/..1.1.1../),1],
         [(/222....../),2],[(/...222.../),2],[(/......222/),2],
         [(/2..2..2../),2],[(/.2..2..2./),2],[(/..2..2..2/),2],
         [(/2...2...2/),2],[(/..2.2.2../),2]]
  end

 
  attr_reader :board
  
  def initialize()
    @board = [0,0,0,0,0,0,0,0,0]
    @HUMAN = 1
    @MACHINE = 2
    @NO_WINNER_YET = -1
  end

  def play()


    game = Tic_tac_toe.new()

    game.display_game_instructions()

    @first_Player = game.get_first_player()
    @winner = game.check_winner()

    while @winner == @NO_WINNER_YET && !game.check_tie()
      if @first_Player == @HUMAN
        human_move = game.get_human_move()
        game.update_board("human",human_move)
        game.display_board()
        @winner = game.check_winner()
        if @winner != @NO_WINNER_YET || game.check_tie()
          break
        end
        start_time = Time.now
        machine_move = game.get_machine_move()
        game.update_board("machine",machine_move)
        game.display_board()
        @winner = game.check_winner()
        end_time = Time.now
        puts "It took: #{end_time-start_time} seconds"
      else
        start_time = Time.now
        machine_move = game.get_machine_move()
        game.update_board("machine",machine_move)
        game.display_board()
        @winner = game.check_winner()
        end_time = Time.now
        puts "It took: #{end_time-start_time} seconds"
        if @winner != @NO_WINNER_YET || game.check_tie()
          break
        end
        human_move = game.get_human_move()
        game.update_board("human",human_move)
        game.display_board()
        @winner = game.check_winner()
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
    display_board([1,2,3,4,5,6,7,8,9],false)
  end
  
  def display_board(board=@board,security=true)
    puts "-------------\n"
    puts "|#{symbol_display(board[0],security)}|#{symbol_display(board[1],security)}|#{symbol_display(board[2],security)}|\n"
    puts "-------------\n"
    puts "|#{symbol_display(board[3],security)}|#{symbol_display(board[4],security)}|#{symbol_display(board[5],security)}|\n"
    puts "-------------\n"
    puts "|#{symbol_display(board[6],security)}|#{symbol_display(board[7],security)}|#{symbol_display(board[8],security)}|\n"
    puts "-------------\n"
  end
  
  def symbol_display(value,security_on=true)
    if security_on
      case value
      when 0
        "   "
      when 1
        " X "
      when 2
        " O "
      else
        puts "symbol_display method on Tic_tac_toe class has"
        puts "received an incorrect value. Only 0,1 or 2 are"
        puts "allowed."
      end
    else
      return " #{value} "
    end
  end
  
  def get_first_player()
    human_first = 1
    machine_first = 2
    puts "Would you like to go first, or to have the machine go first? (y/n)"
    STDOUT.flush()
    option = gets.chomp.downcase
    if option == "y"
      return human_first
    elsif option == "n"
      return machine_first
    else
      whos_first?() 
    end 
  end

  def get_machine_move()
    move = get_winning_pattern_move
    if move.nil?
      move = get_blocking_pattern_move
      if move.nil?
        move = get_first_available_move
      end
    end
    move
  end

  def get_winning_pattern_move
    move = nil
    array = Patterns::Winning.find { |p| p.first =~ @board.join }
    unless array.nil?
      move = array.last
    end
    move
  end

  def get_blocking_pattern_move
    move = nil
    array = Patterns::Blocking.find { |p| p.first =~ @board.join } 
    unless array.nil?
      move = array.last
    end
    move
  end

  def get_first_available_move()
    if @board[4] == 0
      move = 4
    else
      move = @board.index(0)
    end
    move
  end
  
  def get_human_move()
    move = 0
    puts "Please provide your move:"
    STDOUT.flush()
    move = gets.chomp.to_i
    if !(1..9).include?(move)
      puts "Sorry, only numbers between 1 and 9"
      get_human_move()
    elsif board[move-1]!=0
      puts "Sorry, that position is taken"
      get_human_move()
    end
    move-1
  end
   
  def update_board(player,position)
    if player == "human"
      board[position] = 1
    else
      board[position] = 2
    end
  end
  
  
  def check_tie(board=@board)
    its_a_tie = true
    no_tie = false
    if board.index(0) == nil
      return its_a_tie
    else
      return no_tie
    end
  end

  def check_winner()
    start_time = Time.now
    winner = -1
    array = Patterns::Won.find { |p| p.first =~ @board.join }
    unless array.nil?
      winner = array.last
    end
    end_time = Time.now
    winner
  end
  
  def winner?(board,position)
    human_won = 1
    machine_won = 2
    winner_found = true
    winner_not_found = false
    if board[position] == human_won
      return [human_won,winner_found]
    elsif board[position] == machine_won
      return [machine_won,winner_found]
    else
      return[0,winner_not_found]
    end
  end

end
