$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exchange_rate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exchange_rate"
  s.version     = '0.1.0'
  s.authors     = ["Mantas"]
  s.email       = ["M.Serapinas@gmail.com"]
  s.summary     = "Ruby library for obtaining FX rates"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails"
end
