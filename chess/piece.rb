class Piece
   attr_reader :color, :board
   attr_accessor :pos
   def initialize(color, board, position)
      @color = color # :white, :black
      @board = board
      @position = position    
   end

   def moves # not of huge importance. Will be overwritten by every subclass. 

   end

   




end