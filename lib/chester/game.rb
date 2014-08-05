module Chester
  class Game
    attr_accessor :players, :game_state
    def self.build &block
      new.tap { |i| yield(i) }
    end
  end
end