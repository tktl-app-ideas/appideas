require 'spec_helper'

describe IdeasController do
  describe  "GET new" do
    it "assigns all keywords as @keywords" do
      k = Keyword.create name:"Hello"
      get :new, {}
      assigns(:keywords).first.should eq(k)
    end
  end
end
