module SiteAnnouncements
  class Engine < ::Rails::Engine
    isolate_namespace SiteAnnouncements

    config.auth_callback = nil

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'local_helper.action_controller' do
      ActiveSupport.on_load :action_controller do
        helper SiteAnnouncements::ApplicationHelper
      end
    end
  end
end
