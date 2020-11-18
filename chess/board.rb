require_relative "./piece.rb"
require "byebug"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @rows[0][3] = Piece.new("Queen")
        @rows[7][3] = Piece.new("Queen")
        @rows[0][4] = Piece.new("King")
        @rows[7][4] = Piece.new("King")
        @rows[0][2] = Piece.new("Bishop")
        @rows[0][5] = Bishop.new(:black, self, [0,5])
        @rows[7][2] = Piece.new("Bishop")
        @rows[7][5] = Piece.new("Bishop")
        @rows[0][1] = Piece.new("Knight")
        @rows[0][6] = Piece.new("Knight")
        @rows[7][1] = Piece.new("Knight")
        @rows[7][6] = Piece.new("Knight")
        @rows[0][0] = Piece.new("Rook")
        @rows[0][7] = Piece.new("Rook")
        @rows[7][7] = Piece.new("Rook")
        @rows[7][0] = Piece.new("Rook")
        @rows[1].map! { |ele| ele = Piece.new("Pawn") }
        @rows[6].map! { |ele| ele = Piece.new("Pawn") }
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
        x, y = pos
        return false if x > 7 || y > 7
        return false if x < 0 || y < 0
    end



    def print_rows
        puts @rows
    end

end

game = Board.new
game.print_rows
game.move_piece([0,4], [3,4])
game.print_rows