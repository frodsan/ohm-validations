Gem::Specification.new do |s|
  s.name        = "ohm-validations"
  s.version     = "0.0.1"
  s.summary     = "Validation for Ohm::Model."
  s.description = s.summary
  s.authors     = ["Francesco Rodríguez"]
  s.email       = ["frodsan@me.com"]
  s.homepage    = "https://github.com/frodsan/ohm-validations"
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_dependency "ohm"
  s.add_dependency "scrivener"
  s.add_development_dependency "cutest"
  s.add_development_dependency "ohm-contrib"
end
