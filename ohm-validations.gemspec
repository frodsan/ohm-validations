Gem::Specification.new do |s|
  s.name        = "ohm-validations"
  s.version     = "0.0.2"
  s.summary     = "Validations for Ohm models."
  s.description = s.summary
  s.authors     = ["Francesco Rodríguez", "Mayn Kjær"]
  s.email       = ["frodsan@me.com", "mayn.kjaer@gmail.com"]
  s.homepage    = "https://github.com/harmoni/ohm-validations"
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_dependency "ohm"
  s.add_dependency "scrivener"
  s.add_development_dependency "cutest"
  s.add_development_dependency "ohm-contrib"
end
