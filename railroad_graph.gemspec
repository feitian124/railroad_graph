# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'railroad_graph/version'

Gem::Specification.new do |spec|
  spec.name          = "railroad_graph"
  spec.version       = RailroadGraph::VERSION
  spec.authors       = ["feitian124"]
  spec.email         = ["feitian124@gmail.com"]
  spec.description   = %q{The local commuter railroad problem}
  spec.summary       = %q{The local commuter railroad problem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake"
end
