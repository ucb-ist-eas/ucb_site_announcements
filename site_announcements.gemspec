require_relative "lib/site_announcements/version"

Gem::Specification.new do |spec|
  spec.name        = "ucb_site_announcements"
  spec.version     = SiteAnnouncements::VERSION
  spec.authors     = ["Darin Wilson"]
  spec.email       = ["darinwilson@berkeley.edu"]
  spec.homepage    = "https://github.com/ucb-ist-eas/site_announcements"
  spec.summary     = "A Rails engine for site-wide announcement banners"
  spec.description = spec.summary
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"

  spec.add_development_dependency "standard"
  spec.add_development_dependency "rspec-rails", "~> 6.1.0"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "capybara-screenshot"
  spec.add_development_dependency "selenium-webdriver"
end
