require "site_announcements/version"
require "site_announcements/engine"

module SiteAnnouncements
  mattr_accessor :time_zone
  mattr_accessor :auth_callback

  def self.configure(&block)
    configuration = OpenStruct.new(time_zone: Time.zone, auth_callback: nil)
    yield configuration if block
    self.time_zone = configuration.time_zone || "Pacific Time (US & Canada)"
    self.auth_callback = configuration.auth_callback
  end
end
