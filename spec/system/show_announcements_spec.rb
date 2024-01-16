require "rails_helper"

RSpec.describe "Displaying announcements", type: :system do
  let!(:announcement) { UcbSiteAnnouncements::Announcement.create!(message: "Big announcement", category: "info") }

  it "displays active announcements" do
    visit "/"
    expect(page).to have_content("Big announcement")
  end
end
