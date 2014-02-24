require 'spec_helper'

describe "When not signed in" do
  before :each do 
    @idea = Idea.create(name:"Hello Idea", desc:"Great idea")
    @user = User.create(username:"Matt", password:"pass")
		@comment = Comment.build_from( @idea, @user.id, "Hey guys this is my comment!" )
		@comment.save
  end

  it "Comment db has a 1 new comment after commenting" do
			Comment.count.should eq(1)
	end

  it "is not saved when user_id is not given" do
    comment2 = Comment.build_from(@idea, @user, "Great idea")
    expect(comment2.valid?).not_to be(true)
    Comment.count.should eq(1)
  end

  it "is not saved when comment text is not given" do
    comment2 = Comment.build_from(@idea, @user.id, "")
    expect(comment2.valid?).not_to be(true)
    Comment.count.should eq(1)
  end
end
