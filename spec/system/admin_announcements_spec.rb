require "rails_helper"

RSpec.describe "Administering announcements", type: :system do
  let!(:announcement) { SiteAnnouncements::Announcement.create!(message: "Test message", category: "info") }

  describe "authorization" do
    it "allows access if the auth callback permits it" do
      visit announcements_path
      expect(page).not_to have_content("This is home")
    end

    it "blocks access if the auth callback does not permit it" do
      SiteAnnouncements::Engine.config.auth_callback = ->(controller) { false }
      visit announcements_path
      expect(page).to have_content("This is home")
      SiteAnnouncements::Engine.config.auth_callback = ->(controller) { true }
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
    xit "deletes announcement" do
      visit announcements_path

      accept_alert {
        click_on "Delete"
      }

      expect(page).not_to have_content("Test message")
    end
  end

end
