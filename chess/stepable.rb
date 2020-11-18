module Stepable

    def moves
        pos_moves = []

        x, y = self.pos
        move_diffs.each do |dx, dy|
            x += dx
            y += dy
            unless !valid_pos([x,y])
                new_pos = [x, y]
                pos_moves << new_pos
            end
            
        x, y = self.pos
        end

        pos_moves
    end

    private

    def move_diffs
        raise NotImplementedError
    end

end