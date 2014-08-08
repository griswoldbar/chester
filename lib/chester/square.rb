module Chester
  class Square
    attr_reader :x, :y, :piece

    def initialize(x,y,piece)
      @x,@y,@piece = x.to_i,y.to_i,piece
    end
    
    def black?
      @black ||= (x.odd? && y.odd?) || (x.even? && y.even?)
    end
  end
end