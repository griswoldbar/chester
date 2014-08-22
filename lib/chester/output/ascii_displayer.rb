module Chester
  class AsciiDisplayer
    def self.display(game, message=nil)
      new(game, message).display
    end

    def initialize(game,message)
      @game = game
      @board = @game.board
      @message = message
    end

    def display
      output = "|"+ ("-"*multiplier) + "|\n"
      output << print_board(@game.board)
      puts output
    end

    private
    def print_board(board)
      printed_squares = board.map &method(:print_square)

      printed_squares.each_slice(8).map do |row|
        print_row(row)
      end.join
    end

    def print_row(row)
      split_rows = row.map {|s| s.split("").each_slice(8).map{|x| x} }
      3.times.map do |n|
        split_rows.map {|e| e[n] }.join("") + "|\n"
      end.join("") +
      "|#{"-"*multiplier}|\n"
    end

    def print_square(square)
      piece = @board.find_piece_by_square(square)
      output = "|       "
      output << "|   " + print_piece(piece) + "   "
      output << "|       "
      output.gsub!(" ", "#") unless square.black?
      output.gsub!(/#(\w)#/,' \1 ')
      output
    end

    def print_piece(piece)
      char = if piece
        letter = get_letter(piece.class.name)
        letter.downcase! if piece.colour == :black
        letter
      else
        " "
      end
    end

    def get_letter(name)
      case name
      when "Chester::Pawn"
        "P"
      when "Chester::Queen"
        "Q"
      when "Chester::King"
        "K"
      when "Chester::Rook"
        "R"
      when "Chester::Bishop"
        "B"
      when "Chester::Knight"
        "N"
      else
        " "
      end
    end

    def multiplier
      63
    end

  end
end