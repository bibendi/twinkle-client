# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twinkle/client/version'

Gem::Specification.new do |spec|
  spec.name          = "twinkle-client"
  spec.version       = Twinkle::Client::VERSION
  spec.authors       = ["Michail Merkushin"]
  spec.email         = ["merkushin.m.s@gmail.com"]

  spec.summary       = %q{A ruby client for Twinkle notification service.}
  spec.description   = %q{A ruby client for Twinkle notification service}
  spec.homepage      = "https://github.com/bibendi/twinkle-client"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.24"
  spec.add_development_dependency "simplecov", "~> 0.12.0"
end
