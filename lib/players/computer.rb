module Players
  
  class Computer < Player
    FREQ_CELLS = [5, 1, 3, 7, 9, 2, 4, 6, 8]
    def move(board)
      cells = board.cells
      FREQ_CELLS.each {|cell_num|  return cell_num.to_s if cells[cell_num - 1] == ' '  }
    end
  end
end 

#finish minimax later, computer vs computer triggers cats game
# idx = board.cells.find_index(" ")
# idx += 1
# idx.to_s


    # def move(board)
    #   best_score =  -1.0/0.0
    #   best_move = nil
    #   cell_number = 0
    #   while cell_number < board.cells.length
    #     if board.valid_move?(cell_number + 1)
    #       board_cell_save = board.cells
    #       board_cell_save[cell_number] = self.token
    #       # board.update(cell_number, self)
    #       score = minimax(board_cell_save)
    #       # board.cells = board_cell_save

    #       if score > best_score
    #         best_move = cell_number + 1
    #         best_score = score
    #       end
    #     end
    #     cell_number += 1
    #   end
    #   best_move.to_s
    # end

    # def minimax(board_cell_save)
    #   if won?(board_cell_save)
    #     return 1 
    #   elsif board_cell_save.select{|val| val[/\s/]}.length == 0
    #     return 0 
    #   else 
    #     return -1
    #   end
    # end

    # def won?(board_cell_save)
    #   WIN_COMBINATIONS.each do |winning_pattern|
    #     board_cell_save = winning_pattern.map{|idx| board_cell_save[idx]}
    #     return true if  board_cell_save[0] == self.token && board_cell_save.uniq.length == 1
    #   end
    #   false
    # end