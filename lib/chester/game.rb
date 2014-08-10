module Chester
  class Game
    attr_accessor :players, :board, :game_state, :executor
    
    def self.build &block
      new.tap { |i| yield(i) }
    end
    
    def board
      game_state.board
    end
    
    def current_player?(player)
      player == current_player
    end
    
    def next_player
      game_state.switch_players
    end
    
    def current_player
      {0 => :white, 1 => :black}[game_state.current_player]
    end
    
    def execute(move, piece)
      executor.execute(move, piece)
    end
    
    def select_pieces_by(criteria)
      criteria.inject(board.pieces) do |memo, (k,v)|
        memo.select { |piece| piece.send(k) == v }
      end
    end
  end
end