# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/yeoman/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-yeoman"
  spec.version       = Capistrano::Yeoman::VERSION
  spec.authors       = ["Wojtek Krysiak"]
  spec.email         = ["wojciech.g.krysiak@gmail.com"]
  spec.description   = %q{yeoman integration for Capistrano}
  spec.summary       = %q{yeoman integration for Capistrano}
  spec.homepage      = "https://github.com/wojtek-krysiak/capistrano-yeoman"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'capistrano', '~> 3.1'
  spec.add_dependency 'sshkit', '~> 1.3'
end
