require_relative "slideable"
require_relative "piece"

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
        '♛'.colorize(color)
    end

    private
    def move_dirs
        diagonal_dirs
        horizontal_dirs
    end
end