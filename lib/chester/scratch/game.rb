require 'initial_state'

module Chester
  class Game
    def initialize(
      interpreter = Interpreter.new,
      validator = Validator.new,
      board = Board.new)

      @interpreter = interpreter
      @validator = validator
      @board = board
    end

    def go(move) #instance of Move
      interpret!(move)
      if valid?(move)
        execute_move(move)
      end
    end

    private
    def interpret(string)
      @interpreter.interpret(string)
    end

    def valid?(move)
      @validator.valid?(move, board)
    end

    def execute_move(move)
      @board.update(move)
    end

  end
end