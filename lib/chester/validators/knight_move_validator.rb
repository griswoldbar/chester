require 'chester/validators/move_validator'

module Chester
  class KnightMoveValidator < MoveValidator
    
    private
    def doable?
      squared_x_diff = (@x - @target.x)**2
      squared_y_diff = (@y - @target.y)**2
      
      (squared_x_diff + squared_y_diff) == 5
    end
  
  end
end