# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "named_accessors/version"

Gem::Specification.new do |s|
  s.name        = "named_accessors"
  s.version     = NamedAccessors::VERSION
  s.authors     = ["Krzysztof Zalewski"]
  s.email       = ["zlw.zalewski@gmail.com"]
  s.homepage    = "https://github.com/zlw/named_accessors"
  s.summary     = %q{Create attr_accessor (attr_reader/attr_writer) with specified name}
  s.description = %q{Create attr_accessor (attr_reader/attr_writer) with specified name}

  s.rubyforge_project = "named_accessors"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
