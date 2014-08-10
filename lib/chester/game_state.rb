require 'chester/board'
require 'chester/square'
require 'chester/pieces/piece_factory'
require 'chester/util/util'
module Chester
  class GameState
    attr_accessor :board, :current_player

    def self.load(hash)
      new.tap {|gs|
        mapping = hash[:board].inject({}) do |memo, (k, v)|
          x=k.to_s[1]
          y=k.to_s[0]
          memo.merge(Square.new(x,y) => PieceFactory.build(v))
        end
        gs.board = Chester::Board.new(mapping)
        gs.current_player = hash[:current_player]
      }
    end
    
    def switch_players
      @current_player = Util.binary_flip(@current_player)
    end
  end
end