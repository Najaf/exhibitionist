# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exhibitionist/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Najaf Ali"]
  gem.email         = ["ali.najaf@gmail.com"]
  gem.description   = %q{A simple, framework-agnostic implementation of the decorator pattern, inspired by Avdi Grimms exhibits in 'objects on rails'.}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  %w( minitest-reporters ).each do |dep|
    gem.add_development_dependency  dep
  end

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "exhibitionist"
  gem.require_paths = ["lib"]
  gem.version       = Exhibitionist::VERSION
end
