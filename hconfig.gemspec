# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hconfig/version'

Gem::Specification.new do |spec|
  spec.name          = "hconfig"
  spec.version       = Hconfig::VERSION
  spec.authors       = ["Matte Noble"]
  spec.email         = ["me@mattenoble.com"]

  spec.summary       = %q{ENV var to Config object translation with validations.}
  spec.description   = %q{ENV var to Config object translation with validations.}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
