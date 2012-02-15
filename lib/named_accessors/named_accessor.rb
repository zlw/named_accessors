module NamedAccessors
  module NamedAccessor
    def named_accessor(name, options={})
      named_writer(name, options)
      named_reader(name, options)
    end
  end
end