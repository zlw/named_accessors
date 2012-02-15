module NamedAccessors
  module Utilities
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

    def instance_variable_name(name)
      :"@#{name}"
    end
  end
end