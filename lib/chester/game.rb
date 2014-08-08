module Chester
  class Game
    attr_accessor :players, :board, :game_state
    def self.build &block
      new.tap { |i| yield(i) }
    end
    
    def board
      game_state.board
    end
    
    def current_player
      game_state.current_player
    end
  end
end