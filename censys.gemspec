# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'censys/version'

Gem::Specification.new do |gem|
  gem.name          = "censu"
  gem.version       = Censys::VERSION
  gem.summary       = "API client for censys.io"
  gem.description   = "Ruby API client for the Censys Internet search engine."
  gem.license       = "MIT"
  gem.authors       = ["Manabu Niseki"]
  gem.email         = "manabu.niseki@gmail.com"
  gem.homepage      = "https://github.com/ninoseki/censu"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 2.0'
  gem.add_development_dependency 'coveralls', "~> 0.8"
  gem.add_development_dependency 'dotenv', '~> 2.7'
  gem.add_development_dependency 'rake', '~> 12.3'
  gem.add_development_dependency 'rspec', '~> 3.8'
  gem.add_development_dependency 'vcr', '~> 5.0'
  gem.add_development_dependency 'webmock', '~> 3.7'
  gem.add_development_dependency 'yard', '~> 0.9'
end
