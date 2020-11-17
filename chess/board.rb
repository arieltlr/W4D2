require_relative "./piece.rb"
require "byebug"

class Board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        @board[0][3] = Piece.new("Queen")
        @board[7][3] = Piece.new("Queen")
        @board[0][4] = Piece.new("King")
        @board[7][4] = Piece.new("King")
        @board[0][2] = Piece.new("Bishop")
        @board[0][5] = Piece.new("Bishop")
        @board[7][2] = Piece.new("Bishop")
        @board[7][5] = Piece.new("Bishop")
        @board[0][1] = Piece.new("Knight")
        @board[0][6] = Piece.new("Knight")
        @board[7][1] = Piece.new("Knight")
        @board[7][6] = Piece.new("Knight")
        @board[0][0] = Piece.new("Rook")
        @board[0][7] = Piece.new("Rook")
        @board[7][7] = Piece.new("Rook")
        @board[7][0] = Piece.new("Rook")
        @board[1].map! { |ele| ele = Piece.new("Pawn") }
        @board[6].map! { |ele| ele = Piece.new("Pawn") }
    end

    def [](pos)
        x, y = pos
        @board[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @board[x][y] = val
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



    def print_board
        puts @board
    end

end

game = Board.new
game.print_board
game.move_piece([0,4], [3,4])
game.print_board