require "rails_helper"

RSpec.describe "accessing site", type: :system do
  it "can access the dummy app root" do
    visit "/"

    expect(page).to have_http_status(:success)
    expect(page).to have_content("have a pleasant day")
  end
end
