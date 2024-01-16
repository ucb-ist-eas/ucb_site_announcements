module UcbSiteAnnouncements
  class Announcement < ApplicationRecord
    validates_presence_of :message, :category

    def self.active
      now = Time.zone.now

      self
        .where(enabled: true)
        .where("(start_time IS NULL OR start_time < :now) AND (end_time IS NULL OR end_time > :now)", now: now)
    end

    def formatted_start_time
      format_datetime(start_time)
    end

    def formatted_end_time
      format_datetime(end_time)
    end

    private

    def format_datetime(datetime)
      datetime&.strftime("%m/%d/%Y %I:%M %P")
    end
  end
end
