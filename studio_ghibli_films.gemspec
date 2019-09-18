lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "studio_ghibli_films/version"

Gem::Specification.new do |spec|
  spec.name          = "studio_ghibli_films"
  spec.version       = StudioGhibliFilms::VERSION
  spec.authors       = ["munroe1786"]
  spec.email         = ["era3munroe@gmail.com"]

  spec.summary       = %q{Provides information about Ghibli films.}
  spec.description   = %q{This CLI project allows the user to learn about Studio Ghibli films.}
  spec.homepage      = "https://github.com/munroe1786/studio_ghibli_films"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/munroe1786/studio_ghibli_films"
  spec.metadata["changelog_uri"] = "https://github.com/munroe1786/studio_ghibli_films"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "studio_ghibli_films"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "colorize", "~> 0.8.1"
end
