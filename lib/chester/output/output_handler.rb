module Chester
  class OutputHandler
    attr_accessor :outputter
    
    def self.build &block
      new.tap { |i| yield(i) }
    end
    
    def handle(game, output=nil)
      message = if output.is_a? Chester::InterpreterError
        output.message
      else
        outputter.display(game, output)
      end
    end
  end
end