module SiteAnnouncements
  class PagesController < ApplicationController
    include AbstractController::Rendering
    def index
      render plain: "have a pleasant day"
    end
  end
end
