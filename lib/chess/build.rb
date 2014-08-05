Chester::ApplicationBuilder.build do |app|
  app.input_interpreter = Chester::InputInterpreter.build do |i|
    i.move_interpreter = Chester::MoveInterpreter.new
    i.admin_interpreter = Chester::AdminInterpreter.new
  end
end