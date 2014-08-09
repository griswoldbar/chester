require 'chester/moves/regular_move'
require 'chester/moves/queening'
require 'chester/moves/king_side_castle'
require 'chester/moves/queen_side_castle'
require 'chester/validator'

module Chester
  class MoveRunner
    def self.run(game, instruction)
      move_klass = get_move_klass(instruction[:move][:move_type])
      move_klass.new(game, instruction[:player], instruction[:move], Validator).run
    end
    
    def self.get_move_klass(move_type)
      case(move_type)
      when :queening
        Queening
      when :king_side_castle
        KingSideCastle
      when :queen_side_castle
        QueenSideCastle
      else
        RegularMove
      end
    end
    

  end
end