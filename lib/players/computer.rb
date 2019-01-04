module Players
  class Computer < Player
    def move(board)
      logic(board)
    end

    def logic(board)
      x = 0
      o = 0 
      sides = [1,3,5,7]
      corners = [0,2,6,8]
      cpu = self.token
      opp = ""
      cpu == "X" ? opp = "O" : opp = "X"
      if board.valid_move?("5")
        "5"
      else
        Game::WIN_COMBINATIONS.each do |combo|
          combo.each do |i|
            if board.valid_move?(5)
              return 5
            elsif board.cells[i] == cpu
              x += 1
            elsif board.cells[i] == opp
              o += 1
            elsif (x == 2 && o == 0) || (o == 2 && x == 0)
              c = i if board.cells[i] == " "
              return c + 1
            elsif board.cells[0] == opp && board.cells[8] == opp
              foo = sides.detect{|s| board.cells[s] == " "}
              return foo + 1
            elsif board.cells[2] == opp && board.cells[6] == opp
              bar = sides.detect{|s| board.cells[s] == " "}
              return bar + 1
            else
              a = corners.detect{|c| board.cells[c] == " "}
              return a + 1
            end
          end
        end
      end
    end

  end



end
