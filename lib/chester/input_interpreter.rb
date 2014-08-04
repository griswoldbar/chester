module Chester
  class InputInterpreter
    attr_accessor :move_interpreter, :admin_interpreter

    def self.build &block
      new.tap { |i| yield(i) }
    end
  end
end