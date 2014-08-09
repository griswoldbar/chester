module Chester
  class Square
    include Comparable
    attr_reader :x, :y

    def initialize(x,y)
      @x,@y = x.to_i,y.to_i      
    end
    
    # def piece=(new_piece)
    #  (@piece.square = nil) if @piece
    #   
    #   @piece = new_piece
    #   @piece.square = self
    # end
    

    
    def black?
      @black ||= (x.odd? && y.odd?) || (x.even? && y.even?)
    end
    
    def <=>(other)
      y_comparison = self.y <=> other.y
      x_comparison = self.x <=> other.x
      if [1,-1].include?(y_comparison)
        return y_comparison * -1
      else
        return x_comparison
      end
    end
  end
end