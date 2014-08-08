module Chester
  class InputInterpreter
    attr_accessor :move_interpreter, :admin_interpreter

    def self.build &block
      new.tap { |i| yield(i) }
    end

    def interpret(raw_input)
      begin
        if is_admin?(raw_input[:body])
          admin_interpreter.interpret(raw_input)
        else
          move_interpreter.interpret(raw_input)
        end
      rescue Chester::InterpreterError => e
        return e
      end
    end

    def is_admin?(raw_input)
      raw_input.match(/^chester: /)
    end
  end
end