require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    user = FactoryBot.create(:user)
    login_as(user)
    visit root_path
    expect(page).to have_text("Projects")
  end
end

