require 'spec_helper'

describe "Keyword admin page" do
  context "when not signed in" do
    let(:idea) { Fabricate(:idea) }
    let(:keyword) { Fabricate(:keyword) }
    let(:keyword2) { Fabricate(:keyword2) }

    before :each do
      idea.save
      idea.keywords << keyword
      keyword2.save
    end

    it "should list all keywords in main content" do
      visit keywords_path
      within('#main-content') do
        expect(page).to have_content("Mobile")
        expect(page).to have_content("Project")
      end
    end

  end
end
