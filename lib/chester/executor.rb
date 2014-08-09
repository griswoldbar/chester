module Chester
  class Executor
    
    def initialize(game)
      @game = game
      @board = game.board
    end
    
    def execute(move, piece)
      message = ""
      target = move.target
      @board.update(target, piece)
      # if target.occupied?
      #   dead_piece = target.piece
      #   message = "#{piece.type.to_s} takes #{dead_piece.type.to_s}"
      # end
      message
    end
  end
end