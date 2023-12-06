Rails.application.routes.draw do
  mount SiteAnnouncements::Engine => "/site_announcements"
  root to: "home#index"
end
