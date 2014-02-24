require 'spec_helper'

describe "When not signed in" do
  before :each do 
    @idea = Idea.create(name:"Hello Idea", desc:"Great idea")
    @user = User.create(username:"Matt", password:"password")
    @idea.liked_by @user
  end

  it "1 new vote in the db after voting" do
  	  @idea.votes.size.should eq(1)
  end

end
