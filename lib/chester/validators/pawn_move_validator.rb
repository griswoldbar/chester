require 'chester/validators/move_validator'
module Chester
  class PawnMoveValidator < MoveValidator

    private
    def doable?      
      if check_double_step
        return true
      elsif check_vertical_step
        return true
      elsif check_diagonal_steps
        return true
      else
        return false
      end
    end
    
    def non_self_checking?
      true
    end

    def check_double_step
      (@y == 2) && 
      (@board[@x, @y+2] == @target)
    end
    
    def check_vertical_step
      @board[@x, @y+1] == @target
    end
    
    def check_diagonal_steps
      [@board[@x+1,@y+1], @board[@x-1,@y+1]].map do |square|
        occupier = @board.find_piece_by_square(square)
        occupier &&
        occupier.enemy?(@piece) &&
        @target == square
      end.include?(true)
    end
  end
end