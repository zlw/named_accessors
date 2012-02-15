require "named_accessors/version"

module NamedAccessors
  def named_reader(name, options={})
    method_name, variable_name = getter_name(options), name

    define_method method_name do
      instance_variable_get :"@#{variable_name}"
    end
  end

  def named_writer(name, options={})
    method_name, variable_name = setter_name(options), name

    define_method method_name do |val|
      instance_variable_set :"@#{variable_name}", val
    end
  end

  def named_accessor(name, options={})
    named_writer(name, options)
    named_reader(name, options)
  end


private

  def getter_name(options)
    extract_as_option(options)
  end

  def setter_name(options)
    :"#{extract_as_option(options)}="
  end

  def extract_as_option(options)
    options.fetch(:as) rescue raise "You must specify `as` option"
  end
end

class Object
  extend NamedAccessors
end
