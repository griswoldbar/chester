require 'chester/application_builder'
require 'chester/interpreters/move_interpreter'
require 'chester/interpreters/input_interpreter'
require 'chester/interpreters/admin_interpreter'
require 'chester/command_runner'
require 'chester/output_handler'
require 'chester/application'

def app
  @app ||= Chester::ApplicationBuilder.build(Chester::Application) do |app|
    app.command_runner = Chester::CommandRunner.build do |i|

    end

    app.output_handler = Chester::OutputHandler.new

    app.input_interpreter = Chester::InputInterpreter.build do |i|
      i.move_interpreter = Chester::MoveInterpreter.new
      i.admin_interpreter = Chester::AdminInterpreter.new
    end
  end
end