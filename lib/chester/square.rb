module Chester
  class Square
    attr_reader :x, :y, :piece

    def initialize(x,y,piece)
      @x,@y,@piece = x,y,piece
    end
  end
end