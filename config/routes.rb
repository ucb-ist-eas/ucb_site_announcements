UcbSiteAnnouncements::Engine.routes.draw do
  resources :announcements
  root to: "announcements#index"
end
