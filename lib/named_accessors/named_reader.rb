module NamedAccessors
  module NamedReader
    def named_reader(name, options={})
      variable = instance_variable_name(name)

      define_method getter_name(options) do
        instance_variable_get variable
      end
    end
  end
end