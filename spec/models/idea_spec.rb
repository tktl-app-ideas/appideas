require 'spec_helper'

describe Idea do
  let(:idea) { Fabricate(:idea) }

  it "that has been created with correct name" do
    idea2 = Idea.create name:"testi"
    expect(idea2.valid?).to be(true)
    expect(Idea.count).to eq(1) # hmm bugas jossain vaihees niin että oli muka kolme (?) 
  end

  it "should provide a method to list all its keywords" do
    idea.respond_to?(:keywords).should be true
  end

  it "should have a description field" do
    idea.desc.include?("Bacon").should be true
  end
end
