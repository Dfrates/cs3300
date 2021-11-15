require "rails_helper"


RSpec.describe Project, type: :model do

  # Tests if description is present  
  context "validations tests" do
    it "ensures the description is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    # Tests if you can save project object
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do

  end
end

require "rails_helper"

RSpec.describe Project, type: :model do
  # tests for both title and description

  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end

  end
end