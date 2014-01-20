require 'spec_helper'

describe Idea do
		it "should have a method hello" do
				idea = Idea.new
				idea.respond_to?(:hello).should == true
		end
end
