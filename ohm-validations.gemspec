Gem::Specification.new do |s|
  s.name        = "ohm-validations"
  s.version     = "1.0.0"
  s.summary     = "Validations for Ohm models"
  s.description = s.summary
  s.author      = "Francesco Rodríguez"
  s.email       = "frodsan@protonmail.ch"
  s.homepage    = "https://github.com/frodsan/ohm-validations"
  s.license     = "MIT"

  s.files      = Dir["LICENSE", "README.md", "lib/**/*.rb"]
  s.test_files = Dir["test/**/*.rb"]

  s.add_dependency "ohm", ">= 2.0", "~> 3.0"
  s.add_dependency "scrivener", "~> 1.0"
  s.add_development_dependency "minitest", "~> 5.8"
  s.add_development_dependency "minitest-sugar", "~> 2.1"
  s.add_development_dependency "rake", "~> 10.0"
end
