SiteAnnouncements.configure do |config|
  config.auth_callback = ->(controller) { true }
end
