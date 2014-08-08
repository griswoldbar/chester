module Chester
  class CommandRunner
    attr_accessor :move_runner
    
    def self.build &block
      new.tap { |i| yield(i) }
    end

    def run(game, instruction)
      return instruction unless cromulent?(instruction)
      case instruction[:type]
      when :move
        move_runner.run(game, instruction)
      else
        raise "fook orf"
      end
    end

    private
    def cromulent?(instruction)
      !instruction.is_a?(Chester::InterpreterError)
    end
  end
end