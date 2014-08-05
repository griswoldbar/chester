module Chester
  class ApplicationBuilder
    def self.build(app_class, &block)
      app_class.new.tap {|i| yield(i)}
    end
  end
end