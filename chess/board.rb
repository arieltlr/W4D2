require_relative "piece"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "rook"
require_relative "bishop"
require_relative "pawn"
require_relative "null_piece"
require "byebug"

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @rows[0][3] = Queen.new(:black, self, [0,3])
        @rows[7][3] = Queen.new(:white, self, [7,3])
        @rows[0][4] = King.new(:black, self, [0,4])
        @rows[7][4] = King.new(:white, self, [7,4])
        @rows[0][2] = Bishop.new(:black, self, [0,2])
        @rows[0][5] = Bishop.new(:black, self, [0,5])
        @rows[7][2] = Bishop.new(:white, self, [7,2])
        @rows[7][5] = Bishop.new(:white, self, [7,5])
        @rows[0][1] = Knight.new(:black, self, [0,1])
        @rows[0][6] = Knight.new(:black, self, [0,6])
        @rows[7][1] = Knight.new(:white, self, [7,1])
        @rows[7][6] = Knight.new(:white, self, [7,6])
        @rows[0][0] = Rook.new(:black, self, [0,0])
        @rows[0][7] = Rook.new(:black, self, [0,7])
        @rows[7][7] = Rook.new(:white, self, [7,7])
        @rows[7][0] = Rook.new(:white, self, [7,0])
        (0..7).each do |i| 
            @rows[1][i] = Pawn.new(:black, self, [1, i]) 
        end
        (0..7).each do |i| 
            @rows[6][i] = Pawn.new(:white, self, [6, i]) 
        end
        (2..5).each do |row|
            (0..7).each do |col|
                @rows[row][col] = NullPiece.instance
            end
        end
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        raise "no piece there!" if !valid_pos?(start_pos) || self[start_pos].nil?
        raise "can't move there! no man's land!" if !valid_pos?(end_pos)

        piece = self[start_pos]
        self[end_pos] = piece
        self[start_pos] = nil
    end

    def valid_pos?(pos)
        # debugger
        x, y = pos
        # debugger
        return false if x > 7 || y > 7
        return false if x < 0 || y < 0
        true
    end

    # def check if spot is occupied 

    # end



    def print_rows
        puts @rows
    end

end

game = Board.new
game.print_rows
p game.rows[0][2].moves
# game.move_piece([0,4], [3,4])
# game.print_rows