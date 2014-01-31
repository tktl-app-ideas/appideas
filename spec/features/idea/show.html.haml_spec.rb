require 'spec_helper'

describe "When not signed in" do
  before :each do
    fabricate(:idea)

  it "the Idea page should show all related keywords in the sidebar" do
    #idea = Idea.create(name:"Hello Idea", desc:"Great idea")
    idea.keywords.create name:"Project", concrete:false
    Keyword.create name:"Mobile", concrete:false
    visit idea_path(idea)
    expect(page).to have_content("Project")
#    expect(page).to have_no_content("Mobile")
    within '.nav-header' do
      page.should have_no_content 'Mobile'
    end
  end
  
end
