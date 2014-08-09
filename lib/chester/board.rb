module Chester
  class Board
    include Enumerable
    
    attr_reader :squares
    
    def initialize(mapping)
      @mapping = mapping
    end
    
    def each(&block)
      ordered_squares.each { |o| yield(o) }
    end
    
    def [](x,y)
      squares.find {|s| (s.x == x) && (s.y == y) }
    end
    
    def find_square_by_piece(piece)
      @mapping.find {|k,v| v == piece }[0]
    end
    
    def find_piece_by_square(square)
      @mapping[square]
    end
    
    def update(square, piece)
      old_square = find_square_by_piece(piece)
      @mapping[old_square] = nil
      @mapping[square] = piece
    end
    
    def occupied?(square)
      !!@mapping[square]
    end
    
    def pieces
      @mapping.values.compact
    end
    
    def squares
      @mapping.keys
    end
    
    private
    def ordered_squares
      squares.sort
    end
  end
end