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
        # debugger
        pos_moves = []
        # debugger
        move_dirs.each do |x, y|
            # debugger
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
        # debugger
        x, y = @position
        # debugger
        until !@board.valid_pos?([x,y]) # if !@board[new_pos].nil? # add position occupied when you can reference pieces. 
            y += dy
            x += dx
            # debugger
            new_pos = [x, y]
            # debugger
            # if !@board[new_pos].nil?
            #     if self.color != @board[new_pos].color
            #         collected_moves << new_pos
            #     end
            # end
            collected_moves << new_pos if @board.valid_pos?(new_pos)
            # debugger
        end
        collected_moves if !collected_moves.empty? 
    end

end