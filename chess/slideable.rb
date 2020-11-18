module Slideable
    #all logic for where a piece can move. 

    HORIZONTAL_DIRS = [[0, 1][0, -1], [1, 0], [-1, 0]].freeze
    DIAGONAL_DIRS = [[-1, 1], [1,1], [1, -1], [-1, -1]].freeze


    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def horizontal_dirs
        HORIZONTAL_DIRS

    end

    def moves
        pos_moves = []
        move_dirs.each do |x, y|
            pos_moves << grow_unblocked_moves_in_dir(x, y)
        end
        return pos_moves
    end

    private

    def move_dirs
        raise NotImplementedError
    end

    # grow on will continueslly add the direction it could go 
    def grow_unblocked_moves_in_dir(dx, dy)
        collected_moves = []
        x, y = self.pos
        until !valid_pos?([x,y]) # add position occupied when you can reference pieces. 
            y += dy
            x += dx
            new_pos = [x, y]
            collected_moves << new_pos
        end
        collected_moves  
    end



end