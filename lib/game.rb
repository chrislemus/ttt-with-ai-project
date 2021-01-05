class Game
  attr_accessor :board, :player_1, :player_2, :mode
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Backward slash \
    [2,4,6],  # Forward slash /
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    puts "\n!!WELCOME to TicTacToe CLI!!"
    players = nil
    case game_mode
    when 0; players = [Players::Computer.new("X"), Players::Computer.new("O")]
    when 1; players = [Players::Human.new("X"), Players::Computer.new("O")]
    when 2; players = [Players::Human.new("X"), Players::Human.new("O")]
    end
    players.reverse! if first_player? == "O"
    p1, p2 = players
    Game.new(p1, p2).play
    play_again? 
  end

  def game_mode
    puts "\nCHOOSE GAME MODE: \n0 - computer vs computer \n1 - human vs computer \n2 - human vs human"
    mode = gets.chomp.to_i
    mode.between?(0,2) ? mode : game_mode
  end

  def first_player?
    puts "You are be 'X'. Who should go first? 'X' or 'O'?"
    first_player = gets.chomp.upcase
    first_player.match?(/(X|O)/)  ? first_player : first_player?
  end

  def play_again?
    puts "would you like to play again? Enter 'Y' or 'N' "
    case gets.chomp.upcase
    when 'Y'; start
    when 'N'; puts 'Goodbye!'
    else; play_again?
    end
  end

  def current_player
    player = @board.turn_count.even? ? @player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |winning_pattern|
      cells_token = winning_pattern.map{|idx| @board.cells[idx]}
      return winning_pattern if  cells_token[0] != " " && cells_token.uniq.length == 1
    end
    false
  end
  
  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_combo = won?
    @board.cells[winning_combo[0]] if winning_combo
  end

  def turn
    puts "\n Pick a number 1-9 #{current_player.token} #{@mode}"    
    player = current_player
    player_move = player.move(@board)
    if @board.valid_move?(player_move)
      @board.update(player_move, current_player)
      @board.display
    else
      puts "Invalid, try again #{current_player.token}"
      turn
    end    
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
  
end
