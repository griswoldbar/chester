module Chester
  class ApplicationBuilder
    def self.build &block
      Application.new.tap {|i| yield(i)}
    end
  end
end

module Chester
  class InputInterpreter
    attr_accessor :move_interpreter, :admin_interpreter

    def self.build &block
      new.tap {|i| yield(i)}
    end
  end
end

module Chester
  class MoveInterpreter

  end
end

module Chester
  class AdminInterpreter

  end
end

module Chester
  class Application
    attr_accessor :input_interpreter
  end
end

Chester::ApplicationBuilder.build do |app|
  app.input_interpreter = Chester::InputInterpreter.build do |i|
    i.move_interpreter = Chester::MoveInterpreter.new
    i.admin_interpreter = Chester::AdminInterpreter.new
  end
end