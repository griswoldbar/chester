require 'chester/exceptions/interpreter_error'
module Chester
  class MoveInterpreter

    def interpret(raw_input)
      raise Chester::InterpreterError, "I don't understand: #{raw_input}"
    end
  end
end