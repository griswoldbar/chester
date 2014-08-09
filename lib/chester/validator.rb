require 'chester/validators/pawn_move_validator'

module Chester
  module Validator
    extend self
    def build(move, piece)
      case move.class.name
      when "Chester::RegularMove"
        case piece.type
        when :pawn
          PawnMoveValidator.new(move, piece)
        end
      end
    end
  end
end