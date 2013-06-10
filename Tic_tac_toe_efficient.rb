class Tic_tac_toe
  
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
    game.display_board()
    
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
    player = nil
    puts "Would you like to go first, or to have the machine go first? (y/n)"
    STDOUT.flush()
    option = gets.chomp.downcase
    if option == "y"
      player = human_first
    elsif option == "n"
      player = machine_first
    else
      puts "Sorry, its either 'y' or 'n'"
      get_first_player() 
    end 
    player
  end

  def get_machine_move(board=@board)
    start_time = Time.now
    patterns_matrix = [find_vertical_pattern(),find_horizontal_pattern(),find_diagonal_pattern()]
    winning_strategy = patterns_matrix.rassoc(2)
    blocking_strategy = patterns_matrix.rassoc(1)
    no_strategy = get_first_available_move
    move = winning_strategy 
    if move.nil?
      move = blocking_strategy
      if move.nil?
        move = no_strategy
      end
    end
    move.first
  end
  
  def find_vertical_pattern(board=@board)
    no_pattern_match_found = nil
    top_position = 0
    mid_position = 3
    bottom_position = 6
    3.times do 
      if    (board[top_position] != 0 && board[top_position]==board[mid_position] && 
        board[bottom_position]==0)
        return [bottom_position,board[top_position]]
      elsif (board[top_position] != 0 && board[top_position]==board[bottom_position] && 
        board[mid_position]==0)
        return [mid_position,board[top_position]]
      elsif (board[mid_position] != 0 && board[mid_position]==board[bottom_position] && 
        board[top_position]==0)
        return [top_position,board[mid_position]]
      end
      top_position +=1
      mid_position +=1
      bottom_position +=1
    end
    return no_pattern_match_found
  end
  
  def find_horizontal_pattern(board=@board)
    no_pattern_match_found = nil
    left_position = 0
    mid_position = 1
    right_position = 2
    3.times do 
    #Line one
      if (board[left_position] != 0 && 
        board[left_position]==board[mid_position] && 
        board[right_position]==0)
        return [right_position,board[left_position]]
      elsif (board[left_position] != 0 && 
        board[left_position]==board[right_position] && 
        board[mid_position]==0)
        return [mid_position,board[left_position]]
      elsif (board[mid_position] != 0 && 
        board[mid_position]==board[right_position] && 
        board[left_position]==0)
        return [left_position,board[mid_position]]
      end
      left_position +=3
      mid_position +=3
      right_position +=3
    end
    return no_pattern_match_found
  end
  
  def find_diagonal_pattern(board=@board)
    first = 0
    second = 4
    third = 8
    #Diagonals
    2.times do 
     if board[first] != 0 && board[first]==board[second] && 
       board[third]==0
       return [third,board[first]]
     elsif board[first] != 0 && board[first]==board[third] && 
       board[second]==0
       return [second,board[first]]
     elsif board[third] != 0 && board[second]==board[third] && 
       board[first]==0
       return [first,board[second]]
     end
      first = 2
      third = 6
    end
    return nil
  end  
  
  def get_first_available_move()
    if @board[4] == 0
      move = [4,nil]
    else
      move = [@board.index(0),nil]
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
  
  def check_winner(board=@board)
    start_time = Time.now
    checks_matrix = [vertical_win(board), horizontal_win(board), diagonal_win(board)]
    winners = checks_matrix.rassoc(true)
    if winners.nil?
      end_time = Time.now
      return -1
    else
      end_time = Time.now
      return winners.first
    end
  end


  def vertical_win(board)
    winner_not_found = false
    if (board[0]==board[3] && board[3]==board[6] && board[6] != 0)
      return winner?(board,6)
    elsif (board[1]==board[4] && board[4]==board[7] && board[7] != 0)
      return winner?(board,7)
    elsif (board[2]==board[5] && board[5]==board[8] && board[8] != 0)
      return winner?(board,8)
    else
      return [0,winner_not_found]
    end
  end  
  
  def horizontal_win(board)
    winner_not_found = false
    if (board[0]==board[1] && board[1]==board[2] && board[2] != 0)
      return winner?(board,2)
    elsif (board[3]==board[4] && board[4]==board[5] && board[5] != 0)
      return winner?(board,5)
    elsif (board[6]==board[7] && board[7]==board[8] && board[8] != 0)
      return winner?(board,8)
    else
      return [0,winner_not_found]
    end
  end

  def diagonal_win(board)
    winner_not_found = false
    if (board[0]==board[4] && board[4]==board[8] && board[8] != 0)
      return winner?(board,8)
    elsif (board[2]==board[4] && board[4]==board[6] && board[6] != 0)
      return winner?(board,6)
    else 
      return [0,winner_not_found]
    end
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
