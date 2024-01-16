Rails.application.routes.draw do
  mount UcbSiteAnnouncements::Engine => "/ucb_site_announcements"
  root to: "home#index"
end
