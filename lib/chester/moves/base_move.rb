module Chester
  class BaseMove
    attr_reader :game, :board, :player
       
    def initialize(game, player, move, validator_factory)
      @move = move
      @player = player
      @game = game
      @board = game.board
      @validator_factory = validator_factory
    end

    def run
      if correct_player?
        disambiguate
        if (unambiguous? && valid?)
          execute
          post_process
        end
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
    
    def correct_player?
      @correct_player ||= begin
        @game.current_player?(@player)
      end
    end
    
    def output_message
      if !correct_player?
        :wrong_player
      elsif !unambiguous?
        :ambiguous
      elsif !valid?
        :invalid
      else
        @output_message
      end
    end
  end
end