# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json/staircase/version'

Gem::Specification.new do |spec|
  spec.name          = "json-staircase"
  spec.version       = JSON::Staircase::VERSION
  spec.authors       = ["Mark Rickerby"]
  spec.email         = ["me@maetl.net"]
  spec.summary       = %q{Document APIs and data types with JSON Schema.}
  spec.homepage      = "https://github.com/maetl/json-staircase"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency "json-schema"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
