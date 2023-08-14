# frozen_string_literal: true

require_relative "lib/better_validations/version"

Gem::Specification.new do |spec|
  spec.name = "better_validations"
  spec.version = BetterValidations::VERSION
  spec.authors = ["ikouchiha47"]
  spec.email = ["princeofpersiaa3.ag@gmail.com"]

  spec.summary = "Web centric validation library"
  spec.description = "Collection of validations needed in a rails project most of the time"
  spec.homepage = "https://github.com/ikouchiha47/better_validations"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/ikouchiha47"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ikouchiha47/better_validations"
  spec.metadata["changelog_uri"] = "https://github.com/ikouchiha47/better_validations"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activemodel"
  spec.add_dependency "countries", "~> 5.6"
  spec.add_dependency "phony_rails", "~> 0.15"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
