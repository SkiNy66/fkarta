# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fkarta/version"

Gem::Specification.new do |spec|
  spec.name          = "fkarta"
  spec.version       = Fkarta::VERSION
  spec.authors       = ["Stas Iskandarov"]
  spec.email         = ["nevizar128@gmail.com"]

  spec.summary       = "fkarta"
  spec.description   = "fkarta"
  spec.homepage      = "https://github.com/nevizar/fkarta"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/nevizar/fkarta"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec", "~> 3.6"

  # spec.add_dependency "http", "~> 2.2.2"
  spec.add_dependency "stribog", "~> 0.2.0"
  spec.add_dependency "nokogiri", ">= 1.6"
  spec.add_dependency "unicode", "~> 0.4.4.4"
end
