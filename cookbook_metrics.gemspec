# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cookbook_metrics"
  spec.version       = '0.1.0'
  spec.authors       = ["Mark John G. Merin"]
  spec.email         = []

  spec.summary       = %q{Track Chef Supermarket cookbook metrics}
  spec.description   = %q{Chef Supermarket cookbook metrics tracker}
  spec.homepage      = "http://github.com/mjmerin/cookbook_metrics/"
  spec.license       = "MIT"

  spec.files         = ['lib/cookbook_metrics.rb']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = []
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "rest-client", "~> 2.0"
  spec.add_dependency "json", "~> 2.1"
  spec.add_dependency "date", "~> 1.0"
  spec.add_dependency "csv", "~> 3.0"

end