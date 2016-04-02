# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tutorial_central/version'

Gem::Specification.new do |spec|
  spec.name          = "tutorial_central-cli-gem"
  spec.version       = TutorialCentral::VERSION
  spec.authors       = ["Rachel Stratemeier"]
  spec.email         = ["m.rachel.stratemeier@gmail.com"]

  spec.summary       = %q{This gem allows browsing of hackr.io tutorials from the command line.}
  spec.homepage      = "https://github.com/LonghornRach/tutorial_central-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  spec.executables   = ["tutorial_central"]
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/tutorial_central"]

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "highline", "~> 1.7"

  spec.add_development_dependency "bundler", "~> 1.12.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
