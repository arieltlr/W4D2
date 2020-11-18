require_relative "piece"

class Pawn < Piece

    def initialize(color, board, pos)
        super
    end

    def move

    end

    def symbol
        :P
    end

    private

    def at_start_row?
        if self.color == :white && pos[0] == 6
            return true
        else
            return false
        end
        if self.color == :black && pos[0] == 1
            return true
        else
            return false
        end
    end

    def forward_dir # returns 1 or - 1
        if self.color == :white
            -1
        else
            1
        end
    end

    def forward_steps
        pos_moves = [[1, 0]]

        if at_start_row? == true
            pos_moves << [2, 0]
        end

        pos_moves
    end

    def side_attacks
        deltas = [1,1]

    end


end