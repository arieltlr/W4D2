require_relative 'piece'
require_relative 'stepable'

class King < piece
    include stepable

    def symbol
        '♚'.colorize(color)
    end

    protected

    def move_diffs

    end
end

