require 'spec_helper'

describe Idea do
		describe "that has been created with a keyword" do
				it "should provide a method to list all its keywords" do
				end
		end
		it "should have a method hello" do
				idea = Idea.new
				idea.respond_to?(:hello).should == true
		end
end
