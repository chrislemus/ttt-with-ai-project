class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    board_values = @cells.map.with_index {|item, index| 
      last_row_cell = index == @cells.length - 1 ? " #{item} " : " #{item} \n-----------\n"
      ((index + 1) % 3) == 0 ? last_row_cell : " #{item} |"
    }
    puts board_values.join
  end

  def position(player_move)
    @cells[player_move.to_i - 1]
  end

  def full?
    @cells.select{|val| val[/\s/]}.length == 0
  end

  def turn_count
    @cells.select{|val| val[/(X|O)/]}.length
  end

  def taken?(player_move)
    position(player_move).match?(/(X|O)/) 
  end

  def valid_move?(player_move)
    player_move.to_i.between?(1,9) && !taken?(player_move)
  end

  def update(player_move, player)
    @cells[player_move.to_i - 1] = player.token
  end
end