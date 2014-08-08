module Chester
  class Board
    include Enumerable
    
    attr_reader :squares
    
    
    def each(&block)
      ordered_squares.each { |o| yield(o) }
    end
    
    def initialize(squares)
      @squares = squares
    end
    
    def [](x,y)
      @squares.select {|s| (s.x == x) && (s.y == y) }
    end
    
    private
    def ordered_squares
      @squares.sort_by {|s| [s.x, s.y]}.reverse
    end
  end
end