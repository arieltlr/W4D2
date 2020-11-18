require_relative "./slideable.rb"
class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
    end

    def move # logic for where the piece can move. 
    end

    private
    def move_dirs
    end
end