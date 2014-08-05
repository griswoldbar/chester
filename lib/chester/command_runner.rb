module Chester
  class CommandRunner
    def self.build &block
      new.tap { |i| yield(i) }
    end

    def run(instruction)
      return instruction unless cromulent?(instruction)
      "ran: #{instruction}"
    end

    private
    def cromulent?(instruction)
      !instruction.is_a?(Chester::InterpreterError)
    end
  end
end