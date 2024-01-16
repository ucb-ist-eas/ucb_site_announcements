module UcbSiteAnnouncements
  class Engine < ::Rails::Engine
    isolate_namespace UcbSiteAnnouncements

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'local_helper.action_controller' do
      ActiveSupport.on_load :action_controller do
        helper UcbSiteAnnouncements::ApplicationHelper
      end
    end
  end
end
