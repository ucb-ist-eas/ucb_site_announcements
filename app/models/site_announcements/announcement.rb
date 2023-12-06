module SiteAnnouncements
  class Announcement < ApplicationRecord
    def self.active
      now = Time.zone.now

      self
        .where(enabled: true)
        .where("(start_time IS NULL OR start_time < :now) AND (end_time IS NULL OR end_time > :now)", now: now)
    end
  end
end
