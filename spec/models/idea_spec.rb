require 'spec_helper'

describe Idea do
  let(:idea) { Fabricate(:idea) }

  describe "that has been created with a keyword" do
  end

  it "should provide a method to list all its keywords" do
    idea.respond_to?(:keywords).should be true
  end

  it "should have a method hello" do
    idea.respond_to?(:hello).should be true
  end

  it "should have a description field" do
    idea.desc.include?("Bacon").should be true
  end
end
