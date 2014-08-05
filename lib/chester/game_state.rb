require 'chester/board'
require 'chester/square'
require 'chester/pieces/piece_factory'
module Chester
  class GameState
    attr_accessor :board, :current_player

    def self.load(hash)
      new.tap {|gs|
        squares = hash[:board].inject([]) do |memo, (k, v)|
          x=k.to_s[0]
          y=k.to_s[1]
          memo << Square.new(x,y,PieceFactory.build(v))
          memo
        end
        gs.board = Chester::Board.new(squares)
        gs.current_player = hash[:current_player]
      }
    end
  end
end