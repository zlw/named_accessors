module NamedAccessors
  module NamedWriter
    def named_writer(name, options={})
      variable = instance_variable_name(name)

      define_method setter_name(options) do |val|
        instance_variable_set variable, val
      end
    end
  end
end