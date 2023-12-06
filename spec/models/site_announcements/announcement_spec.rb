require "rails_helper"

RSpec.describe SiteAnnouncements::Announcement, type: :model do

  before(:each) do
    # Freeze time
    @now = Time.utc(2020, 1, 1, 12, 0, 0)
    allow(Time).to receive(:now).and_return(@now)
  end

  context "active_announcements scope" do

    # Valid scenarios
    it "includes enabled with no time range" do
      announcement = create_announcement(enabled: true)
      expect(SiteAnnouncements::Announcement.active).to eq [announcement]
    end

    it "includes enabled with matching time range" do
      announcement = create_announcement(
        enabled: true,
        start_time: 11.hours.ago,
        end_time: 1.hour.from_now
      )

      expect(SiteAnnouncements::Announcement.active).to eq [announcement]
    end

    it "includes enabled with start time in past" do
      announcement = create_announcement(
        enabled: true,
        start_time: 1.day.ago
      )

      expect(SiteAnnouncements::Announcement.active).to eq [announcement]
    end

    it "includes enabled with end time in future" do
      announcement = create_announcement(
        enabled: true,
        end_time: 1.hour.from_now
      )

      expect(SiteAnnouncements::Announcement.active).to eq [announcement]
    end

    # Invalid scenarios
    it "excludes disabled even if time range matches" do
      announcement = create_announcement(
        enabled: false,
        start_time: 11.hours.ago,
        end_time: 1.hour.from_now
      )

      expect(SiteAnnouncements::Announcement.active).to eq []
    end

    it "excludes enabled with start time in future" do
      announcement = create_announcement(
        enabled: true,
        start_time: 1.hour.from_now
      )

      expect(SiteAnnouncements::Announcement.active).to eq []
    end

    it "excludes enabled with end time in past" do
      announcement = create_announcement(
        enabled: true,
        end_time: 1.day.ago
      )

      expect(SiteAnnouncements::Announcement.active).to eq []
    end

  end

  def create_announcement(options = {})
    SiteAnnouncements::Announcement.create!(
      {
        message: "Test",
        category: "info"
      }.merge(options)
    )
  end

end
