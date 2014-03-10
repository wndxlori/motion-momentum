# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motion-momentum/version'

Gem::Specification.new do |spec|
  spec.name          = "motion-momentum"
  spec.version       = Momentum::VERSION
  spec.authors       = ["Jack Dean Watson-Hamblin"]
  spec.email         = ["info@fluffyjack.com"]
  spec.summary       = %q{Momentum is a RubyMotion framework for creating iOS and OS X applications the "Rails" way.}
  spec.description   = %q{Whether you're a Rails developer or not, RubyMotion is Ruby for iOS and OS X and so it should be treated that way. Momentum is a RubyMotion framework for creating iOS and OS X applications the "Rails" way, with helpful ways to clean up and organise your code, and some standardised convention-over-configuration stuff.}
  spec.homepage      = "https://github.com/FluffyJack/motion-momentum"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "motion-redgreen"
end
