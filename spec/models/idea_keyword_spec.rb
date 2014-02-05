require 'spec_helper'

describe IdeaKeyword do
  it "there is working link between one Idea and one Keyword" do
    idea = Idea.create name:"test"
    kw = Keyword.create name:"kwtest"

    idea.keywords << kw

    expect(idea.keywords.count).to eq(1)
  end    

  it "you can add several Keywords to one Idea" do
    idea = Idea.create name:"test"
    kw1 = Keyword.create name:"kwtest1"
    kw2 = Keyword.create name:"kwtest2"
    kw3 = Keyword.create name:"kwtest3"
    
    idea.keywords << kw1
    idea.keywords << kw2
    idea.keywords << kw3

    expect(idea.keywords.count).to eq(3)
  end

  it "you can add one Keyword to several Ideas" do
    idea1 = Idea.create name:"test"
    idea2 = Idea.create name:"test2"
    kw = Keyword.create name:"kwtest"

    idea1.keywords << kw
    idea2.keywords << kw
    
    expect(kw.ideas.count).to eq(2)
  end
    
end
    
