UcbSiteAnnouncements.configure do |config|
  config.auth_callback = ->(controller) { true }
  config.time_zone = "Pacific Time (US & Canada)"
end
