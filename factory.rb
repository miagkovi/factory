class Factory

	def self.new(*attributes, &block)

    Class.new do

      self.send(:attr_accessor, *attributes)

      self.send(:define_method, :initialize) do |*values|
        values.each_with_index { |val, i| self.send("#{attributes[i]}=", val) }
      end

      self.send(:define_method, :[]) do |arg|
      	arg.is_a?(Integer) ? instance_variable_get(instance_variables[arg]) : send(arg.to_sym)
      end

      self.class_eval(&block) if block_given?

    end

  end

end