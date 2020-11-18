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
    def move_dirs
        
    end
end