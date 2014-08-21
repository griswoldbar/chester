require 'chester/pieces/pawn'
require 'chester/pieces/king'
require 'chester/pieces/queen'
require 'chester/pieces/rook'
require 'chester/pieces/knight'
require 'chester/pieces/bishop'

module Chester
  module PieceFactoryTwo
    extend self
    def build(char)
      return nil if char == "x"

      colour = get_colour(char)
      klass = get_class(char)
      klass.new(colour)
    end

    private
    def get_class(char)
      case char.upcase
      when "P"
        Pawn
      when "K"
        King
      when "Q"
        Queen
      when "R"
        Rook
      when "N"
        Knight
      when "B"
        Bishop
      end
    end

    def get_colour(char)
      if char.match(/[a-z]/)
        :black
      else
        :white
      end
    end

  end
  module PieceFactory
    extend self
    def build(string)
      return nil if string.nil?

      colour = get_colour(string[0])
      klass = get_class(string[1])
      klass.new(colour)
    end

    private
    def get_class(string)
      case string
      when "P"
        Pawn
      when "K"
        King
      when "Q"
        Queen
      when "R"
        Rook
      when "N"
        Knight
      when "B"
        Bishop
      end
    end

    def get_colour(string)
      case string
      when "W"
        :white
      when "B"
        :black
      end
    end
  end
end




