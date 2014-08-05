module Chester
  class Application
    attr_accessor :input_interpreter,
                  :command_runner,
                  :output_handler

    def handle(input)
      instruction = input_interpreter.interpret(input)
      output = command_runner.run(instruction)
      output_handler.handle(output)
    end

    # private
    # def execute(instruction)
    #   case instruction.class.name
    #   when "Move"
    #     move_processor.handle(instruction)
    #   when "Admin"
    #     admin_processor.handle(instruction)
    #   end
    # end

  end
end