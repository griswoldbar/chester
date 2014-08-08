module Chester
  class MoveRunner
    def self.run(game, move)
      new(game, move).run
    end
    
    def initialize(game, move)
      @move = move
      @game = game
    end
    
    def run
      return true
    end
  end
end