Dir[File.dirname(__FILE__) + '/named_accessors/*.rb'].each {|file| require file }

module NamedAccessors
  include Utilities
  include NamedReader
  include NamedWriter
  include NamedAccessor
end

class Object
  extend NamedAccessors
end
