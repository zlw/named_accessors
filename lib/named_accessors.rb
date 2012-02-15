%w{version utilities named_reader named_writer named_accessor}.each do |filename|
  require "named_accessors/#{filename}"
end

module NamedAccessors
  include Utilities
  include NamedReader
  include NamedWriter
  include NamedAccessor
end

class Object
  extend NamedAccessors
end
