module NamedAccessors
  module NamedAccessor
    def named_accessor(name, options={})
      reader, writer = extract_accessor_options(options)

      named_reader(name, reader)
      named_writer(name, writer)
    end
  end
end