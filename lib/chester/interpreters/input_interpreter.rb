module Chester
  class InputInterpreter
    attr_accessor :move_interpreter, :admin_interpreter

    def self.build &block
      new.tap { |i| yield(i) }
    end

    def interpret(raw_input)

      return "interpreted: #{raw_input}"
    end
  end
end