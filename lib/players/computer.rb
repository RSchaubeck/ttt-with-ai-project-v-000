module Players
  class Computer < Player
    def move(board)
      if start(board)
        start(board)
      elsif block_or_win(board)
        block_or_win(board)
      else
        strats(board)
      end
    end

    def start(board)
      board.valid_move?(5) ? 5 : false
    end

    def block_or_win(board)
      cpu = self.token
      opp = ""
      cpu == "X" ? opp = "O" : opp = "X"
      Game::WIN_COMBINATIONS.each do |combo|
        a = combo.select{|x| board.cells[x] == cpu}
        b = combo.select{|x| board.cells[x] == opp}
        if a.count(cpu) == 2 && b.count(opp) == 0
          win = combo.detect{|x| board.cells[x] == " "}
          return win + 1
        elsif a.count(cpu) == 0 && b.count(opp) == 2
          block = combo.detect{|x| board.cells[x] == " "}
          return block + 1
        end
      end
      false
    end

    def strats(board)
      cpu = self.token
      opp = ""
      cpu == "X" ? opp = "O" : opp = "X"
      sides = [1,3,5,7]
      corners = [0,2,6,8]
      if board.cells[0] == opp && board.cells[8] == opp
        a = sides.detect{|s| board.cells[s] == " "}
        return a + 1
      elsif board.cells[2] == opp && board.cells[6] == opp
        b = sides.detect{|s| board.cells[s] == " "}
        return b + 1
      else
        c = corners.detect{|c| board.cells[c] == " "}
        return c + 1 if c != nil
      end
    end

  end



end
