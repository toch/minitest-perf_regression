# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/perf_regression/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-perf_regression"
  spec.version       = Minitest::PerformanceRegression::VERSION
  spec.authors       = ["Christophe Philemotte"]
  spec.email         = ["christophe.philemotte@8thcolor.com"]
  spec.summary       = %q{Detect performance regression of your tests.}
  spec.description   = %q{By annotating your test, profile their performance and check performance regression since last run.}
  spec.homepage      = "https://github.com/toch/minitest-perf_regression"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "minitest"
  spec.add_runtime_dependency "benchmark-lab"
  spec.add_runtime_dependency "json"
end
