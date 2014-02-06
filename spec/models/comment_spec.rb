require 'spec_helper'

describe "When not signed in" do
  before :each do 
    @idea = Idea.create(name:"Hello Idea", desc:"Great idea")
    @user = User.create(username:"Matt")
		@comment = Comment.build_from( @idea, @user.id, "Hey guys this is my comment!" )
		@comment.save
  end

  it "Comment db has a 1 new comment after commenting" do
			Comment.count.should eq(1)
	end

end
