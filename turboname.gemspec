# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turboname/version'

Gem::Specification.new do |spec|
  spec.name          = "turboname"
  spec.version       = Turboname::VERSION
  spec.authors       = ["José Tomás Albornoz"]
  spec.email         = ["jojo@eljojo.net"]
  spec.description   = %q{finding domain names at lightspeed}
  spec.summary       = %q{Simple gem that searches for random domain names and tells you if they're available}
  spec.homepage      = "https://github.com/eljojo/turboname"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "shoulda"
  
  spec.add_dependency('whois', '>= 2.0.0') # we should actually test with this version. i just picked a random one
end
