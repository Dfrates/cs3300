require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit new_project_path
      fill_in "project[title]", with: "Test title"
      
    end

    scenario "should be successful" do
      fill_in "project[description]", with: "Test title"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_project_path(project)
      fill_in "project[title]", with: "Test title"
    end

    scenario "should be successful" do
      fill_in "project[description]", with: "Test description"
      click_button "Update project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      click_button "Update project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    # Create a project
    let!(:project) { Project.create(title: "Test title", description: "Test content") }

    before(:each) do
      # Log in
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
    end

   
    scenario "remove project" do
      visit projects_path
      click_on "Delete"
      
      expect(Project.count).to eq(0)
    end
  end
end
