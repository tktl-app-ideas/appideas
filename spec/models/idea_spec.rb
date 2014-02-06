require 'spec_helper'

describe Idea do
  before(:each) do
    @idea = Fabricate(:idea)
  end

  it "has been created with name and description" do
    expect(@idea.valid?).to be(true)
    expect(Idea.count).to eq(1) # hmm bugas jossain vaihees niin että oli muka kolme (?) 
  end

  it "should provide a method to list all its keywords" do
    @idea.respond_to?(:keywords).should be true
  end

  it "should have a description field" do
    @idea.desc.include?("Bacon").should be true
  end

  it "is not saved if description is not given" do
    idea2 = Idea.create name:"test"
    expect(idea2.valid?).not_to be(true)
    expect(Idea.count).to eq(1)
  end

  it "is not saved if name is not given" do
    idea2 = Idea.create name:"", desc:"test description"        
    expect(idea2.valid?).not_to be(true)
    expect(Idea.count).to eq(1)
  end
end
