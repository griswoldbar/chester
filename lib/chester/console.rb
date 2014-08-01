module Chester
  # class Input
  #   attr_writer :is_admin, :is_move, :cromulent
  #   def initialize(raw)
  #     @raw = raw
  #   end
  #
  #   def is_admin?
  #     @is_admin
  #   end
  #
  #   def is_move?
  #     @is_move
  #   end
  #
  #   def cromulent?
  #     @cromulent
  #   end
  # end

  class Console
    def initialize(interpreter=InputInterpreter.new)
      @interpreter = interpreter
    end

    def process(input)
      command = @interpreter.interpret(input)
      if command.cromulent?
        processor.process(command)
      else
        "i don't understand what you mean"
      end
    end

    private
    def processor
      case command.class
      when Move
        @move_processor
      when Admin
        @admin_processor
      end
    end

    def move_processor
      @move_processor ||= MoveProcessor.new
    end

    def admin_processor
      @admin_processor ||= AdminProcessor.new
    end
  end
end