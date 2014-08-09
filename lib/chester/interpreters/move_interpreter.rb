require 'chester/exceptions/interpreter_error'
module Chester
  class MoveInterpreter
    VALID_MOVE = /(?<castle>^[0Oo](?<queen_castle>-[0Oo]){1,2}$)|^(?<piece>[KQBRN])?(?<source_file>[a-h])?(?<source_rank>[1-8])?x?(?<target_file>[a-h])(?<target_rank>[1-8])(?<queening_piece>[KQBRN])?$/
        
    def interpret(input)
      interpretation = input[:body].match(VALID_MOVE)
      raise Chester::InterpreterError, "I don't understand: #{input[:body]}" unless interpretation
      
      instruction = {
        type: :move,
        player: input[:player],
        move: build_move(interpretation)
      }
    end
    
    private
    def build_move(interpretation)
      {
        type: get_move_type(interpretation),
        piece: get_piece(interpretation[:piece]),
        source_file: get_file(interpretation[:source_file]),
        source_rank: interpretation[:source_rank] &&  interpretation[:source_rank].to_i,
        target_file: get_file(interpretation[:target_file]),
        target_rank: interpretation[:target_rank].to_i,
        queening_piece: get_piece(interpretation[:queening_piece])
      }
    end
  
    def get_move_type(move)
      if move[:queen_castle]
        :queen_side_castle
      elsif move[:castle]
        :king_side_castle
      elsif move[:queening_piece]
        :queening
      else
        :regular
      end
    end
    
    def get_file(char)
      {
        "a" => 1,
        "b" => 2,
        "c" => 3,
        "d" => 4,
        "e" => 5,
        "f" => 6,
        "g" => 7,
        "h" => 8 
      }[char]
    end
    
    def get_piece(char)
      {
        "Q" => :queen,
        "K" => :king,
        "B" => :bishop,
        "R" => :rook,
        "N" => :knight,
        nil => :pawn
      }[char]
    end
  end
end