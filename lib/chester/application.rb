module Chester
  class Application
    attr_accessor :input_interpreter,
                  :command_runner,
                  :output_handler,
                  :game

    
    #input comes in as a hash from some other adaptor
    #{
    #  user: "Jim",
    #  body: "NKP3"  
    #}
    def handle(input)
      instruction = input_interpreter.interpret(input)
      output_message = command_runner.run(game, instruction)
      output_handler.handle(game, output_message)
    end
    
    def display
      puts output_handler.handle(game)
    end

  end
end