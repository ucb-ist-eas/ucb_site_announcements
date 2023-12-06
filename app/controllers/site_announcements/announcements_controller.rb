module SiteAnnouncements
  class AnnouncementsController < ApplicationController

    # Controller concerns
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]

    # GET /announcements
    def index
      @announcements = Announcement.all
    end

    # GET /announcements/1
    def show
    end

    # GET /announcements/new
    def new
      @announcement = Announcement.new
    end

    # GET /announcements/1/edit
    def edit
    end

    # POST /announcements
    def create
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        redirect_to @announcement, notice: "Announcement was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /announcements/1
    def update
      if @announcement.update(announcement_params)
        redirect_to @announcement, notice: "Announcement was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /announcements/1
    def destroy
      @announcement.destroy
      redirect_to announcements_url, notice: "Announcement was successfully destroyed."
    end

    private

    # Use callbacks to share common setup
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow whitelist of parameters
    def announcement_params
      params.require(:announcement).permit(:message, :category, :start_time, :end_time, :enabled)
    end

  end
end
