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
      @mapping.find {|k,v| piece == v }[0]
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
      PieceProxy.build_pieces(@mapping)
    end
    
    def squares
      @mapping.keys
    end
    
    private
    def ordered_squares
      squares.sort
    end
        
    class PieceProxy
      def self.build_pieces(mapping)
        mapping.select {|k,v| v }.map do |k,v|
          new(v).tap do |proxy|
            proxy.x = k.x
            proxy.y = k.y
          end
        end.compact
      end
      
      attr_accessor :x, :y
      
      def ==(other)
        if other.is_a?(PieceProxy)
          self == other
        else
          @piece == other
        end
      end
      
      def initialize(piece)
        @piece = piece
      end
      
      private
      def method_missing(method, *args, &block)
        if @piece.respond_to?(method)
          @piece.send(method, *args, &block)
        else
          super
        end
      rescue
        require 'pry';binding.pry
      end
    end
  end
end