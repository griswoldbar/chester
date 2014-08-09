module Chester
  class Piece
    attr_reader :colour, :type    
    def initialize(colour)
      @colour = colour
    end
    
    def type
      self.class.name.downcase.split("::")[1].to_sym
    end
    
    def enemy?(other)
      self.colour != other.colour
    end
  end
end