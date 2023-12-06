module SiteAnnouncements
  class Engine < ::Rails::Engine
    isolate_namespace SiteAnnouncements

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
