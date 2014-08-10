module Chester
  class MoveValidator
    def initialize(move, piece)
      @move = move
      @piece = piece
      @target = move.target
      @board = move.board
      piece_square = @board.find_square_by_piece(@piece)
      @x = piece_square.x
      @y = piece_square.y
    end
    
    def executable?
      doable? &&
      non_self_checking?
    end
    
    private
    def doable?;end
    def non_self_checking?
      true
    end
  end
end