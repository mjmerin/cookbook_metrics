# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cookbook_metrics"
  spec.version       = '0.1.0'
  spec.authors       = ["Mark John G. Merin"]
  spec.email         = []

  spec.summary       = %q{Track Chef Supermarket cookbook metrics}
  spec.description   = %q{Track Chef Supermarket cookbook metrics}
  spec.homepage      = "http://github.com/mjmerin/cookbook_metrics/"
  spec.license       = "MIT"

  spec.files         = ['lib/cookbook_metrics.rb']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = []
  spec.require_paths = ["lib"]
end