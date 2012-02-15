module NamedAccessors
  module NamedWriter
    def named_writer(name, options={})
      method_name, variable_name = setter_name(options), name

      define_method method_name do |val|
        instance_variable_set :"@#{variable_name}", val
      end
    end
  end
end