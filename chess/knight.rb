require_relative "stepable"
require_relative "piece"

class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end

    def symbol
        '♞'.colorize(color)
    end

    private
    def move_diffs
        dirs = [
        [-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1]
        ]
    end
end