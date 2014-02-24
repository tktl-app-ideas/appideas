require 'spec_helper'

describe "Idea page" do
  context "when not signed in" do
    let(:idea) { Fabricate(:idea) }
    let(:keyword) { Fabricate(:keyword) }
    let(:keyword2) { Fabricate(:keyword2) }

    before :each do
      idea.save
      idea.keywords << keyword
      keyword2.save 
    end

    it "should show all related keywords in the sidebar" do
      visit idea_path(idea)
      within('#left-sidebar') do
        expect(page).to have_content("Mobile")
      end
    end

    it "should show only all related keywords in main content" do
      visit idea_path(idea)
      within('#main-content') do
        expect(page).to have_content("Mobile")
        expect(page).not_to have_content("Project")
      end
    end

  end
end
