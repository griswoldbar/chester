module Chester
  class CommandRunner
    def self.build &block
      new.tap { |i| yield(i) }
    end

    def run(instruction)
      "ran: #{instruction}"
    end
  end
end