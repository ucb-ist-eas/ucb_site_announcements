require "rails_helper"

RSpec.describe "Administering announcements", type: :system do
  let!(:announcement) { UcbSiteAnnouncements::Announcement.create!(message: "Test message", category: "info") }

  describe "authorization" do
    it "allows access if the auth callback permits it" do
      visit announcements_path
      expect(page).not_to have_content("You are not authorized")
    end

    it "blocks access if the auth callback does not permit it" do
      UcbSiteAnnouncements.configure do |config|
        config.auth_callback = ->(controller) { false }
      end
      visit announcements_path
      expect(page).to have_content("You are not authorized")
      UcbSiteAnnouncements.configure do |config|
        config.auth_callback = ->(controller) { true }
      end
    end
  end

  describe "time zone config" do
    it "stores times in utc and displays in configured time zone" do
      current_time_zone = UcbSiteAnnouncements.time_zone
      UcbSiteAnnouncements.configure do |config|
        config.time_zone = "Eastern Time (US & Canada)"
      end
      local_time = Time.zone.parse("2023-01-01 10:00:00 Eastern Time (US & Canada)")

      visit new_announcement_path
      fill_in "Message", with: "Special sale!"
      select "Info", from: "Category"
      fill_in "Start time", with: local_time

      click_on "Create Announcement"

      expect(UcbSiteAnnouncements::Announcement.last.start_time).to eq(local_time.utc)

      visit announcement_path(UcbSiteAnnouncements::Announcement.last)

      expect(page).to have_content("01/01/2023 10:00 am")
      UcbSiteAnnouncements.configure do |config|
        config.time_zone = current_time_zone
      end
    end
  end

  describe "GET /index" do
    it "displays existing announcements" do
      visit announcements_path
      expect(page).to have_content("Test message")
    end
  end

  describe "GET /show" do
    it "displays announcement details" do
      visit announcement_path(announcement)

      expect(page).to have_content("Test message")
      expect(page).to have_content("info")
    end
  end

  describe "GET /new" do
    it "displays form to create new announcement" do
      visit new_announcement_path

      expect(page).to have_field("Message")
      expect(page).to have_field("Category")
    end
  end

  describe "POST /create" do
    it "creates a new announcement" do
      visit new_announcement_path

      fill_in "Message", with: "Special sale!"
      select "Info", from: "Category"
      click_button "Create Announcement"

      expect(page).to have_content("Special sale!")
      expect(page).to have_content("Announcement was successfully created")
    end

    it "displays errors for invalid data" do
      visit new_announcement_path
      click_button "Create Announcement"

      expect(page).to have_content("Message can't be blank")
    end
  end

  describe "GET /edit" do
    it "displays form to edit announcement" do
      visit edit_announcement_path(announcement)

      expect(page).to have_field("Message", with: "Test message")
    end
  end

  describe "PATCH /update" do
    it "updates announcement" do
      visit edit_announcement_path(announcement)

      fill_in "Message", with: "Updated message"
      click_button "Update Announcement"

      expect(page).to have_content("Updated message")
    end
  end

  describe "DELETE /destroy", js: true do
    it "deletes announcement" do
      visit announcements_path

      accept_alert {
        click_on "Delete"
      }

      expect(page).not_to have_content("Test message")
    end
  end

end
