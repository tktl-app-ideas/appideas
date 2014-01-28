require 'spec_helper'

describe "When not signed in" do
  it "the Idea index page should list all the ideas" do
    Idea.create(name:"Hello Idea", desc:"Great idea")
    visit ideas_path
    expect(page).to have_content("Hello Idea")
  end
end
