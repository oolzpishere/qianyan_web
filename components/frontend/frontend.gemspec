require_relative "lib/frontend/version"

Gem::Specification.new do |spec|
  spec.name        = "frontend"
  spec.version     = Frontend::VERSION
  spec.authors     = ["Ernest Lee"]
  spec.email       = ["oolzpishere@126.com"]
  spec.homepage    = "https://github.com/oolzpishere"
  spec.summary     = ": Summary of Frontend."
  spec.description = ": Description of Frontend."
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = ": Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/oolzpishere"
  spec.metadata["changelog_uri"] = "https://github.com/oolzpishere"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.2.3"
end
