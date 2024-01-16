module UcbSiteAnnouncements
  module ApplicationHelper
    def active_site_announcements
      Announcement.active.map do |a|
        content_tag(:div, a.message, class: "alert alert-#{a.category}")
      end.join.html_safe
    end
  end
end
