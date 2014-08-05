module Chester
  class OutputHandler

    def handle(output)
      message = if output.is_a? Chester::InterpreterError
        output.message
      else
        output
      end

      "handled: #{output}"
    end
  end
end