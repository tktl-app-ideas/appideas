require 'spec_helper'

describe "Navibar" do
  context "when not signed in" do
    let(:idea) { Fabricate(:idea) }
    let(:keyword) { Fabricate(:keyword) }

    before :each do
      idea.save
      idea.keywords << keyword
    end

    it "should be in all the sites" do
      # TO-DO: fix this loop to check all paths
      #paths = Rails.application.routes.named_routes.helpers.each do |path|
      #  visit(path) if path.to_s.include? "_path"
      #  expect(page).to have_content("New Idea")
      #end

      # workaroud:
      visit root_path
      expect(page).to have_content("New Idea")
      visit ideas_path
      expect(page).to have_content("New Idea")
    end

    it "should include links to Ideas and New Idea" do
      visit ideas_path
      expect(page).to have_content("Idea")
      expect(page).to have_content("New Idea")
    end
  end
end

