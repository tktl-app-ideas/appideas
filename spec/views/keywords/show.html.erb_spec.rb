require 'spec_helper'

describe "keywords/show" do
  before(:each) do
    @keyword = assign(:keyword, stub_model(Keyword,
      :name => "Name",
      :concrete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/false/)
  end
end
