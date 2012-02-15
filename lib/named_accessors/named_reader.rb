module NamedAccessors
  module NamedReader
    def named_reader(name, options={})
      method_name, variable_name = getter_name(options), name

      define_method method_name do
        instance_variable_get :"@#{variable_name}"
      end
    end
  end
end