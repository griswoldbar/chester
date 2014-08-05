module Chester
  class Application
    attr_accessor :input_interpreter,
                  :command_runner,
                  :output_handler,
                  :game_state


    def handle(input)
      instruction = input_interpreter.interpret(input)
      output = command_runner.run(instruction)
      output_handler.handle(output)
    end

  end
end