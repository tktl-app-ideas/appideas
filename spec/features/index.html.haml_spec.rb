require 'spec_helper'

describe "Front page" do
  context "When not signed in" do
    let(:idea) { Fabricate(:idea) }
    let(:keyword) { Fabricate(:keyword) }

    before :each do
      idea.save
      idea.keywords << keyword
    end

    it "the Idea index page should list all the ideas" do
      visit ideas_path
      expect(page).to have_content("Hello Idea")
    end

    it "the Idea index page should show all keywords in the sidebar" do
      visit ideas_path
      expect(page).to have_content("Mobile")
    end
  end
end
