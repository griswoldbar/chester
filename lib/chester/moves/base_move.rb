module Chester
  class BaseMove
    attr_reader :game, :board
       
    def initialize(game, player, move, validator_factory)
      @move = move
      @player = player
      @game = game
      @board = game.board
      @validator_factory = validator_factory
    end

    def run
      disambiguate
      if (unambiguous? && valid?)
        execute
        post_process
      end
      output_message
    end

    def piece_type
      @move[:piece]
    end
    
    private
    def disambiguate;end
    def post_process;end
    
    def execute
      @game.execute(self, @piece)
    end
    
    def unambiguous?
      !@ambiguous
    end
    
    def valid?
      !@invalid
    end
    
    def output_message
      if !unambiguous?
        "ambiguous move"
      elsif !valid?
        "invalid move"
      else
        @output_message
      end
    end
  end
end