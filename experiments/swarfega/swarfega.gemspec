# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swarfega/version'

Gem::Specification.new do |spec|
  spec.name          = "swarfega"
  spec.version       = Swarfega::VERSION
  spec.authors       = ["Mick Pollard"]
  spec.email         = ["aussielunix@gmail.com"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "Copyright BP 2014"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('methadone', '~> 1.3.2')
  spec.add_dependency('mechanize')
end
