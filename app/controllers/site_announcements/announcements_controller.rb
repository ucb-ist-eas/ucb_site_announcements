module SiteAnnouncements
  class AnnouncementsController < ::ApplicationController
    around_action :set_time_zone
    before_action :check_auth
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]

    def index
      @announcements = Announcement.all
    end

    def show
    end

    def new
      @announcement = Announcement.new
    end

    def edit
    end

    def create
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        redirect_to announcements_url, notice: "Announcement was successfully created."
      else
        render :new
      end
    end

    def update
      if @announcement.update(announcement_params)
        redirect_to announcements_url, notice: "Announcement was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @announcement.destroy
      redirect_to announcements_url, notice: "Announcement was successfully destroyed."
    end

    private

    def set_time_zone(&block)
      Time.use_zone(SiteAnnouncements.time_zone, &block)
    end

    def check_auth
      callback = SiteAnnouncements.auth_callback
      if callback.present? && !callback.call(self)
        redirect_to "/", alert: "You are not authorized to access this page"
      end
    end

    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:message, :category, :start_time, :end_time, :enabled)
    end

  end
end
