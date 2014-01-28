require 'spec_helper'

describe "When not signed in" do
  before :each do 
    @idea = Idea.create(name:"Hello Idea", desc:"Great idea")
  end

  it "the Keyword index page should show all keywords in the sidebar" do
    @idea.keywords.create name:"Project", concrete:false
    Keyword.create name:"Mobile", concrete:false
    visit keywords_path      
    expect(page).to have_content("Project")
    expect(page).to have_content("Mobile")
  end
end
