require 'chester/board'
require 'chester/square'
require 'chester/piece'
module Chester
  class GameState
    attr_accessor :board, :current_player

    def self.load(hash)
      new.tap {|gs|
        squares = hash.inject([]) do |memo, (k, v)|
          x=k[0]
          y=k[1]
          memo << Square.new(x,y,Piece.build(v))
        end
        gs.board = Chester::Board.new(squares)
        gs.current_player = hash[:current_player]
      }
    end
  end
end